import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//change the ellipsis iconbutton functionality and make it do something later

class InstaList extends StatefulWidget {

  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isPressed = false;
  List<String> postList = [
    "https://wallpapercave.com/wp/wp5403673.jpg",
    "https://i.pinimg.com/originals/a0/15/47/a01547ebd95cceedf7ec83915a868cac.jpg",
    "https://wallpaperaccess.com/full/1366192.jpg",
    "https://wallpaperaccess.com/full/2099733.png",
    "https://i.pinimg.com/originals/2e/48/0b/2e480b3b763edbe54d696f22b115bc71.jpg",
    "https://wallpaper.dog/large/179686.jpg",
    "https://wallpaperaccess.com/full/4692034.jpg",
    "https://i.pinimg.com/originals/75/5d/d6/755dd6ac085cf71d9f8e83bfbea38d62.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context,index) => index == 0 ?
          new SizedBox(
            height: deviceSize.height * 0.01,
          )
          :Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //the circle showing your name and profile pic before the post
                        new Container(
                          height: deviceSize.height * 0.05,
                          width: deviceSize.height * 0.05,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                                image: new NetworkImage("https://i.pinimg.com/originals/ac/fb/1c/acfb1c8b6125c63502630c63e00d93ad.jpg"),
                            ),
                          ),
                        ),
                        new SizedBox(width: 10,),
                        new Text("Brie",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.white, height: 1.5), ),
                      ],
                    ),
                    new IconButton(
                      icon:Icon(FontAwesomeIcons.ellipsisV,color: kWhite,),
                      onPressed: null, //change this later
                    ),
                  ],
                ),
                ),
                Flexible(
                  fit:FlexFit.loose,
                  child:Image.network(
                    postList[index],
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(
                            isPressed ? Icons.favorite
                                :FontAwesomeIcons.heart
                          ),
                        color: isPressed ? Colors.red : Colors.white,
                        onPressed: (){
                            setState(() {
                              isPressed = !isPressed;
                            });
                        },
                      ),
                      new SizedBox(width: 16,),
                      new Icon(FontAwesomeIcons.comment, color: kWhite,),
                      new SizedBox(width: 16,),
                      new Icon(FontAwesomeIcons.paperPlane,color: kWhite,),
                    ],
                  ),
                ),
              ],

            ),
    );
  }
}
