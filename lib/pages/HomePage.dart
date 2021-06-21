import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//if user is not sign-in/authenticate sign page appears else the homescreen appears

final GoogleSignIn gSignIn = GoogleSignIn();

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  bool isSignedIn = false;

  controlSignIn(GoogleSignInAccount googleSignAcc) async{
    if(googleSignAcc != null){
      setState(() {
        isSignedIn = true;
      });
    }
    else{
      setState(() {
        isSignedIn=false;
      });
    }
  }
  void initState(){
    super.initState();

    gSignIn.onCurrentUserChanged.listen((gSignInAccount) {
      controlSignIn(gSignInAccount!);
    }, onError: (gError){
      print("Error message:"+gError);
    });
    // ignore: unnecessary_statements
    gSignIn.signInSilently(suppressErrors: false).then((gSignInAccount){
      controlSignIn(gSignInAccount!);
    }).catchError((gError){
      print("Error message:"+gError);
    });
  }

  loginUser(){
    //google account signin
    gSignIn.signIn();
  }


  buildHomeScreen(){
    return Text('User already Signed in');
  }
  Scaffold buildSignInScreen(){
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          ),
        ) ,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("InstaLike",style: TextStyle(fontSize: 92.0, color: Colors.white, fontFamily: "Signatra"),),
            GestureDetector(
              onTap: () =>loginUser(),
              child: Container(
                width: 270.0,
                height: 65.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/google_signin_button.png"),
                    fit:BoxFit.cover,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    if(isSignedIn){
      //homescreen widget is returned
      return buildHomeScreen();
    }
    else{
      //signinscreen widget is returned
      return buildSignInScreen();
    }
  }
}
