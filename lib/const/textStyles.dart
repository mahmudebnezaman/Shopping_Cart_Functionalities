import 'package:flutter/material.dart';

TextStyle textStyle1 (){
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
}

TextStyle textStyle2 ({color = Colors.black}){
  return TextStyle(
    color: color,
    fontSize: 11,
  );
}

TextStyle textStyle3 ({fontWeight = FontWeight.bold, color = Colors.black,}){
  return TextStyle(
    fontSize: 14,
    fontWeight: fontWeight,
      color: color,
  );
}

TextStyle textStyle4 ({fontWeight = FontWeight.bold}){
  return TextStyle(
    fontSize: 18,
    fontWeight: fontWeight,
  );
}