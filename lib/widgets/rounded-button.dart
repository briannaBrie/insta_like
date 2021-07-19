import 'package:insta_like/pallete.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget{

  final String buttonName;

  const RoundedButton({Key? key, required this.buttonName,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.pink,
      ),
      child: TextButton(
        onPressed: (){
          
        },
        child: Text(buttonName, style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
      ),
    );
  }

}