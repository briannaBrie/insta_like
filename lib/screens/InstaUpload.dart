import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta_like/pallete.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class InstaUpload extends StatefulWidget {
  @override
  _InstaUploadState createState() => _InstaUploadState();

}

class _InstaUploadState extends State<InstaUpload> {
  //ref for our firebase storage
  late CollectionReference imgRef;
  late firebase_storage.Reference ref;

  bool uploading = false;
  double val = 0;

  List<File> _image = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(
            Icons.arrow_back_ios,
            color: kWhite,
          ),
        ),
        title: Text('Add Image', style:GoogleFonts.lobster(
          color: Colors.pink,
          fontSize: 30,
        )),
       actions: [
          TextButton(onPressed: (){
            setState(() {
              uploading = true;
            });
            //After uploading the files into the database,
            // pop navigator back to instaRoot on the uploads section
            uploadFile().whenComplete(() => Navigator.of(context).pop());
          },
            child: Text('Add',
              style:GoogleFonts.lobster(
                color: Colors.white,
                fontSize: 22,),),
          ),
        ],
      ),
      //check to see if there are any images that have been uploaded so far
      body:Stack(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            child: new StaggeredGridView.countBuilder(
                //this is because the first spot is reserved for the plus sign
                itemCount: _image.length + 1,
                itemBuilder: (context, index) {
                  return index == 0 ? Center(
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.camera, color: Colors.white,),
                      onPressed: ()=>
                        //function file to choose images
                        //disable the button after it has been pressed
                        !uploading ?chooseImage():null
                    ),
                  )
                      :Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        fit:BoxFit.cover,
                        image: FileImage(_image[index-1]),
                      ),
                    ),
                  ) ;
                },
                staggeredTileBuilder: (int index) {
                  return new StaggeredTile.count(1,index.isEven ?1.2:1.8,);
                },
                crossAxisCount: 3,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,

              ),
          ),
              //:
            //if no images have been uploaded then
          /*Container(
              child: Row(
                children: [
                  SizedBox(width: 8.0,),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.plus, color: Colors.white,),
                    onPressed: (){
                      //function to choose images
                      chooseImage();
                      },),
                ],
              ),
          ),*/
          //if uploading is true
          uploading?Center(
            child:Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                Container(
                  child: Text('uploading...',
                      style:GoogleFonts.lobster(color: Colors.white,fontSize: 14,)),),
                SizedBox(height: 10,),
                CircularProgressIndicator(
                  value:val,
                  valueColor:AlwaysStoppedAnimation<Color>(Colors.green),),
              ],),
          ):Container(),
        ],
      ),
    );
  }
  //upload the chosen image(s) to firebase storage
  Future uploadFile()async{
    int i = 1;
    for(var img in _image){
      setState(() {
        val = i/_image.length;
      });
      //create a ref for all the images we get to be uploaded
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/${Path.basename(img.path)}');
      //put the images into the ref create
      await ref.putFile(img).whenComplete(() async{
        //using the download url the value of the url
        // will be added into the firebase database
        //which can also be used to display the pics in the uploads page
        await ref.getDownloadURL().then((value){
          imgRef.add({'url': value});
          i++;
        });
      });
    }
    @override
    void initState(){
      super.initState();
      //the downloadURL will be added to the reference in the fb database
      imgRef = FirebaseFirestore.instance
          .collection('imgURLS');
    }
  }
  //Choose image from local storage
   chooseImage() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if(pickedFile!.path == null){
      //if we lose the image it can be retrieved here
      retrieveLostData();
    }
  }
  //retrieve the lost image and add it to the list
  Future<void> retrieveLostData()async{
    final LostData response = await picker.getLostData();
    if (response.isEmpty){
      return;
    }
    if(response.file != null){
      setState(() {
        _image.add(File(response.file!.path));
      });
    }
    else{
      print(response.file);
    }
  }
}
