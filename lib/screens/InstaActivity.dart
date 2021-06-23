
import 'package:insta_like/pages/HomePage.dart';
import 'package:insta_like/pallete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InstaActivity extends StatefulWidget{
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return getBody();
  }
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: <Widget>[
              Container(
                width: 65,
                height: 65,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //image:DecorationImage(image: 'assets/',fit: BoxFit.cover)
                      ),
                    ),
                  ],
                ),
              ),
            ],),
          ),
        ],
      ),
    );
  }
}