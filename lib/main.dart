import 'package:flutter/material.dart';
import 'package:insta_like/pages/HomePage.dart';
import 'package:insta_like/screens/SignUp.dart';
import 'package:insta_like/screens/SignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaLike',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch:Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      //initialRoute: '/',
      routes: {
        '/':(context) => SignIn(),
      },
    );
  }
}
