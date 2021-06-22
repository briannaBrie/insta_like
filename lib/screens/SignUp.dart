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
                    //start here to add the positioned widget, textinput and passinput
                    Positioned(
                      top: size.height * 0.08,
                        left: size.width * 0.56,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color:Colors.pink,
                            shape: BoxShape.circle,
                            border: Border.all(color: kWhite, width: 2),
                          ),
                          child: Icon(
                            FontAwesomeIcons.arrowUp,
                            color:kWhite,
                          ),
                        ),),
                  ],
                ),
                SizedBox(height: size.width *0.1,),
                Column(
                  children: [
                    Text('Welcome to InstaLike',style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),),
                    SizedBox(height: size.width *0.1,),

                    TextInputField(icon: FontAwesomeIcons.user,
                        hint: 'User',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next),
                    TextInputField(icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next),
                    PasswordInput(icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.done),
                    SizedBox(height: 25,),
                    RoundedButton(buttonName:'Register'),
                    SizedBox(height: 30,),
                    Row(

                    ),
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