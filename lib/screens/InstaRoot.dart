import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class InstaRoot extends StatefulWidget {
  @override
  _InstaRootState createState() => _InstaRootState();
}

class _InstaRootState extends State<InstaRoot> {
  int pageIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(

        preferredSize:const Size.fromHeight(60),
          child: getBar(),
      ),

      //backgroundColor: Colors.black,
      bottomNavigationBar:getFooter(),
    );

  }
 /* Widget getAppBar() {
      if(pageIndex == 0){
        return AppBar(
          title:Row(
            children: <Widget>[
              SvgPicture.asset("assets/images/camera_icon.svg",width: 30, )
            ],
          ) ,
        );
      }
  }*/
Widget getBar(){
  Size size = MediaQuery.of(context).size;
  bool folded = true;
  if(pageIndex == 0){
    //homepage
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SvgPicture.asset("assets/images/camera_icon.svg", width: 30,),
        Text(
          'Instagram',
          style:GoogleFonts.lobster(textStyle:headerText),
        ),
        SvgPicture.asset("assets/images/message_icon.svg", width: 30,),
      ],
    ),);
  }

  else if(pageIndex == 1){
    //search page
    return AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[500]!.withOpacity(0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: kElevationToShadow[6],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: TextField(
                  cursorColor:Colors.white12,
                  style: kBodyText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height*0.08,
              width: size.width*0.8,
              decoration: BoxDecoration(
                color:Colors.grey[500]!.withOpacity(0.5),
              ),
              child: IconButton(
                icon:Icon(Icons.search),
                color: kWhite,
                onPressed: () {  },
              ),
            ),
          ],
        ),
    );
        
  }
  else if(pageIndex == 2){
    //upload page
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Upload',
            style:GoogleFonts.lobster(textStyle:headerText),
          ),
          SvgPicture.asset("assets/images/upload_icon.svg", width: 30,),
        ],
      ),);
  }
  else if(pageIndex == 3){
    //Activity page
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Favorites',
            style:GoogleFonts.lobster(textStyle:headerText),
          ),
          SvgPicture.asset("assets/images/love_icon.svg", width: 30,),
        ],
      ),);
  }
  else{
    //Subscription
    return AppBar(
      backgroundColor: Colors.black,

    );
  }
}
  Widget getFooter() {
    List footerItems = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      pageIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: footerColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(footerItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: SvgPicture.asset(footerItems[index], width: 27,),

            );
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
