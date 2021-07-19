import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';

class TextInputField extends StatefulWidget{
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) :
        super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  String _attribute = "";

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Padding (padding:const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      height: size.height*0.08,
      width: size.width*0.8,
      decoration: BoxDecoration(
        color: Colors.grey[500]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextFormField(
          validator: (input){
            if(input!.isEmpty){
              return 'Please fill in this field';
            }
          },
          onSaved: (input) =>_attribute = input!,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(padding:const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(widget.icon, size: 28,color: kWhite,),
            ),
            hintText: widget.hint,
            hintStyle: kBodyText
          ),
          style: kBodyText,
          keyboardType: widget.inputType,
          textInputAction: widget.inputAction,
        ),
      ),
    ),
    );
  }
}