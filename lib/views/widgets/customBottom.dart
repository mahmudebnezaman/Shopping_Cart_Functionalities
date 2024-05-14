import 'package:cart_functionalities/const/snackBar.dart';
import 'package:cart_functionalities/const/strings.dart';
import 'package:cart_functionalities/const/textStyles.dart';
import 'package:flutter/material.dart';

Widget customBottom({
  required context,
  required total,
  required orientation,
}) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            totalAmount,
            style: textStyle3(
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          Text(total.toString(), style: textStyle4()),
          Text(
            '\$',
            style: textStyle4(),
          ),
        ],
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: (orientation == Orientation.portrait) ? MediaQuery.sizeOf(context).height * 0.06 : MediaQuery.sizeOf(context).height * 0.08,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(
                  content:
                  "Your Order has been Placed :)"),
            );
          },
          child: Text(
            checkOut,
            style: textStyle3(),
          ),
        ),
      ),
    ],
  );
}
