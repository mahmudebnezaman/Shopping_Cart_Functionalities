import 'package:cart_functionalities/const/textStyles.dart';
import 'package:flutter/material.dart';

SnackBar showSnackBar({required String content}) {
  return SnackBar(
    content: Text(
      content,
      style: textStyle2(
        color: Colors.white,
      ),
    ),
    padding: const EdgeInsets.all(20.00),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.green[600],
    elevation: 10,
  );
}
