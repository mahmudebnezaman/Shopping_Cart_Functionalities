import 'package:cart_functionalities/const/textStyles.dart';
import 'package:flutter/material.dart';

AlertDialog customAlertDialog({
  required context,
  required title,
  required content,
  required orientation,
}) {
  return AlertDialog(
    surfaceTintColor: Colors.white,
    title: Center(
      child: Text(
        title,
        style: textStyle4(),
      ),
    ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: textStyle4(
          fontWeight: FontWeight.normal,
        ),
      ),
      contentPadding: const EdgeInsets.all(40.00),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height:(orientation == Orientation.portrait) ? MediaQuery.sizeOf(context).height * 0.06 : MediaQuery.sizeOf(context).height * 0.08,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OKAY"),
          ),
        )
      ],
  );
}
