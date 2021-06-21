import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_like/pallete.dart';
import 'package:insta_like/widgets/widgets.dart';

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image:"assets/images/register_bg.png", key: null),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.width*0.1,),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child:CircleAvatar(radius: size.width*0.14,
                        backgroundColor: Colors.grey[400]!.withOpacity(0.4,),
                          child: Icon(FontAwesomeIcons.user,
                          color: kWhite,
                              size: size.width*0.1,),
                        ),
                        ),
                      ),),
                  ],
                ),
              ],
            ),
          )
        ),

      ],
    );
  }
}