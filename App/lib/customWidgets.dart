import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myTextField({required TextEditingController controllerTxt,required String hintTxt,required TextInputType type}){
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child:TextField(
        controller: controllerTxt,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),
      ) ,
  );


}