import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';
import 'package:insta_like/widgets/background-image.dart';
import 'package:insta_like/widgets/password-input.dart';
import 'package:insta_like/widgets/text-field-input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/login_bg.png',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'InstaLike',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next),
                  PasswordInput(
                      icon: FontAwesomeIcons.lock,
                      hint: 'Password',
                      inputAction: TextInputAction.done),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text('Forgot Password', style: kBodyText,),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, 'SignUp'),
                child: Container(
                  child: Text('Sign Up',style: kBodyText,),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: kWhite)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],),
        ),
      ],
    );
  }
}