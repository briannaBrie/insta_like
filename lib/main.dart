import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_like/screens/InstaRoot.dart';
import 'package:insta_like/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner:false,
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InstaLike',
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(Theme
            .of(context)
            .textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InstaRoot(),
        'SignUp': (context) => SignUp(),
        'ForgotPassword': (context) => ForgotPasword(),
        'InstaRoot': (context) => SignIn(),
      },
    );
  }
}




