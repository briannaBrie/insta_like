import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaLike',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        dialogBackgroundColor: Colors.black,
        primarySwatch: Colors.blueGrey,
        cardColor: Colors.white70,
        accentColor: Colors.black
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to InstaLike',
              style:TextStyle(color:Colors.white, fontSize:20.0, fontWeight: FontWeight.bold),
        ),
      ),
    body: Center(
          child: Text('InstaLike', style: TextStyle(color: Colors.white, fontSize: 30.0),),
      ),
    )
    );
  }
}
