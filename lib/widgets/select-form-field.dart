import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_like/pallete.dart';

class SelectFormField extends StatefulWidget {
  const SelectFormField({Key? key}) : super(key: key);

  @override
  _SelectFormFieldState createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectFormField> {
  String packageValue = 'Free';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding (padding:const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height*0.08,
        width: size.width*0.4,
        decoration: BoxDecoration(
          color: Colors.grey[500]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: DropdownButton(
            focusColor: Colors.white,
            value: packageValue,
            //icon:const Icon(Icons.arrow_downward),
            iconSize: 28,
            elevation: 16,
            style: dropText,
            dropdownColor: Colors.grey[500]!.withOpacity(0.5),

            iconEnabledColor:kWhite,
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue){
              setState(() {
                packageValue =newValue!;
              });
            },

            items: <String>["Free","Pro", "Gold"].map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem(value:value, child: Text(value));
            }).toList(),

          ),
        ),
      ),
    );
  }
}
