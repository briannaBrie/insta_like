import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insta_like/pallete.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';


class InstaRoot extends StatefulWidget {
  @override
  _InstaRootState createState() => _InstaRootState();
}

class _InstaRootState extends State<InstaRoot> {
  int pageIndex = 0;
  List<String> imageList = [
    "https://wallpapercave.com/wp/wp5403673.jpg",
    "https://i.pinimg.com/originals/a0/15/47/a01547ebd95cceedf7ec83915a868cac.jpg",
    "https://wallpaperaccess.com/full/1366192.jpg",
    "https://wallpaperaccess.com/full/2099733.png",
    "https://i.pinimg.com/originals/2e/48/0b/2e480b3b763edbe54d696f22b115bc71.jpg",
    "https://wallpaper.dog/large/179686.jpg",
    "https://wallpaperaccess.com/full/4692034.jpg",
    "https://i.pinimg.com/originals/75/5d/d6/755dd6ac085cf71d9f8e83bfbea38d62.jpg",
  ];

  Material myTiles(IconData kIcon, String kText,Color kColor){
    return Material(
      //create a single tile general properties
      color: Colors.white12,
      elevation: 14.0,
      shadowColor:Colors.white10,
      borderRadius: BorderRadius.circular(24),
      //the properties inside the tile
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(kText,
                          style: TextStyle(
                              fontSize: 22,
                              color: kColor,
                              height: 1.5,
                          ),
                        ),
                      ),
                    ),
                    //icon
                    Material(
                      color: kColor,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          kIcon,
                          color:kWhite,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
              ),
            ],
          ),
        ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: getBar(),
      ),
      body:PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: getBody(),
      ),
      //backgroundColor: Colors.black,
      bottomNavigationBar:getFooter(),
    );
  }

  Widget getBody(){
    Size size = MediaQuery.of(context).size;
    bool folded = true;
    if(pageIndex ==0){
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(flex: 1, child: new InstaStories()),
            Flexible(child: InstaList()),
          ],
        ),

      );
    }
    else if(pageIndex ==3){
      //uploads
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(12),
          child: new StaggeredGridView.countBuilder(
            itemCount: imageList.length,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemBuilder: (context, index){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child:FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (index){
                return new StaggeredTile.count(1,index.isEven ?1.2:1.8,);
              },
          ),

        ),
      );
    }
    if(pageIndex ==4){
      //profile
      return Scaffold(
        backgroundColor: Colors.black,
        body:StaggeredGridView.count(
          crossAxisCount: 2,//no of columns you would want
          crossAxisSpacing: 12,//spacing btwn the tiles vertical
          mainAxisSpacing: 12,//spacing btwn the tiles horziontal
          padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: <Widget>[
            //list of all the tiles you will have
            myTiles(FontAwesomeIcons.users,"Subscriptions",accentColor),
            myTiles(FontAwesomeIcons.userCog,"Action Log",kBlue),
            myTiles(FontAwesomeIcons.addressCard,"Contact us",kOrange),
            myTiles(FontAwesomeIcons.userShield,"Admin",kAmber),
            myTiles(FontAwesomeIcons.registered,"Registration",kLightBlue),
            myTiles(FontAwesomeIcons.idCardAlt,"Bio",kPurple),
            myTiles(FontAwesomeIcons.heart,"Favorites",accentColor),//graphs
          ],
          staggeredTiles: [
            StaggeredTile.extent( 2, 140,),//count of columns the tile occupies on each row(1st parameter), height(2nd))
            StaggeredTile.extent( 1, 150,),
            StaggeredTile.extent( 1, 150,),
            StaggeredTile.extent( 2, 140,),
            StaggeredTile.extent( 1, 150,),
            StaggeredTile.extent( 1, 150,),
            StaggeredTile.extent( 2, 240,),
          ],
        ),
      );
    }
    else{
      return Scaffold(
        backgroundColor: Colors.white30,
      );
    }
      //homepage



  }
Widget uploadList(String pic){
    return Container(
      /* decoration: BoxDecoration(
       image: DecorationImage(
          fit:BoxFit.fill,
          image: NetworkImage(pic),
        ),
      ),*/
      child: Image.asset(pic),
    );
}

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
          Text(
            'Search',
            style:GoogleFonts.lobster(textStyle:headerText),
          ),
          SvgPicture.asset("assets/images/search_icon.svg", width: 30,),
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Profile',
            style:GoogleFonts.lobster(textStyle:headerText),
          ),
          SvgPicture.asset("assets/images/account_active_icon.svg", width: 30,),
        ],
      ),
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








