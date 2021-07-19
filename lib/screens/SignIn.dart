import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_like/pallete.dart';
import 'package:insta_like/screens/InstaRoot.dart';
import 'package:insta_like/widgets/background-image.dart';
import 'package:insta_like/widgets/password-input.dart';
import 'package:insta_like/widgets/rounded-button.dart';
import 'package:insta_like/widgets/text-field-input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget{

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/login_bg.png',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:SafeArea(
            child: Column(
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
  //--Form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
  //--email
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: size.height*0.08,
                            width: size.width*0.8,
                            decoration: BoxDecoration(
                              color: Colors.grey[500]!.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  //email
                                  TextFormField(
                                    validator: (input){
                                      if(input!.isEmpty){
                                        return 'Please fill in this field';
                                      }
                                    },onSaved: (input) =>_email = input!,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Icon(
                                          FontAwesomeIcons.envelope,
                                          size: 28,
                                          color: kWhite,
                                        ),
                                      ),
                                      hintStyle: kBodyText,
                                      hintText: 'Email',
                                    ),
                                    style: kBodyText,
                                    keyboardType:TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ),
  //--email
                     Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10),
                       child: Container(
                         height:size.height*0.08,
                         width:size.width*0.8,
                         decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                           color: Colors.grey[500]!.withOpacity(0.5),
                         ),
                         child: TextFormField(
                           validator: (input){
                             if(input!.isEmpty){
                               return 'please input your password';
                             }
                             },
                           onSaved: (input) =>_password =input!,
                           decoration: InputDecoration(
                              prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Icon(FontAwesomeIcons.lock, color: kWhite,
                                  size:28
                                ),
                             ),
                             border: InputBorder.none,
                             hintText: 'Password',
                             hintStyle: kBodyText,
                           ),
                           style: kBodyText,
                           obscureText: true,
                           textInputAction: TextInputAction.done,
                         ),
                       ),
                     ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                        child: Text('Forgot Password', style: kBodyText,),
                      ),
                      SizedBox(height: 25,),
                      //login button
  //--login button
                      Container(
                        height: size.height*0.08,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:TextButton(
                          onPressed: () {
                            signIn();
                          },
                          child: Text(
                            'Login',
                            style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
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
        ),
      ],
    );
  }
  Future <void> signIn() async{
    //VALIDATE THE FIELDS. if they are true login into firebase
    final _formState  = _formKey.currentState;
    if(_formState!.validate()){
      //login to firebase
      _formState.save();

      try{
        var user =await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _email,
            password: _password);
        //if login is correct go to instaroot page
        //Navigator.push(context, MaterialPageRoute(builder: (context) =>InstaRoot()));
        Navigator.pushNamed(context, 'InstaRoot');
      }
      catch(e){
        //if login is incorrect provide user with an error message
        print(e.toString());
      }
      var user =await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password);
    }


  }
}