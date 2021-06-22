import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';
import 'package:insta_like/widgets/background-image.dart';
import 'package:insta_like/widgets/rounded-button.dart';
import 'package:insta_like/widgets/text-field-input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasword extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image:"assets/images/register_bg.png", key: null),
        Scaffold(
            backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
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
            title: Text('Forgot Password', style:kBodyText,),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(child: Column(
                children: [
                  SizedBox(height: size.height * 0.1,),
                  Container(
                    width: size.width * 0.8,
                    child: Text("Enter your email and we\'ll send instructions on how ot reset you password",
                    style: kBodyText,),
                  ),
                  SizedBox(height: 20.0),
                  TextInputField(icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done),
                  SizedBox(height: 20.0,),
                  RoundedButton(buttonName: 'Send')
                ],
              ),)
            ],
          ),
        ),
      ],
    );
  }
  
}