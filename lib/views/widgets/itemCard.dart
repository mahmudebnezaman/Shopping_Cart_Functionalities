import 'package:cart_functionalities/const/textStyles.dart';
import 'package:flutter/material.dart';

Card itemCard({
  required context,
  required itemImage,
  required itemTitle,
  required itemColor,
  required itemSize,
  required itemQuantity,
  required itemPrice,
  required addFunction,
  required subFunction,
  required orientation,
}) {
  return Card(
    child: Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
          ),
          child: Image.asset(
            itemImage,
            width: (orientation == Orientation.portrait) ? MediaQuery.sizeOf(context).width * 0.3 : MediaQuery.sizeOf(context).width * 0.15,
            height: (orientation == Orientation.portrait) ? MediaQuery.sizeOf(context).width * 0.3 : MediaQuery.sizeOf(context).width * 0.15,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemTitle,
                    style: textStyle1(),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Color: ',
                            style: textStyle2(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            itemColor,
                            style: textStyle2(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Size: ',
                            style: textStyle2(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            itemSize,
                            style: textStyle2(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                quantityChangerButton(Icons.remove, subFunction),
                Text(
                  itemQuantity,
                  style: textStyle3(),
                ),
                quantityChangerButton(Icons.add, addFunction),
              ],
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                children: [
                  Text(
                    itemPrice,
                    style: textStyle3(),
                  ),
                  Text(
                    '\$',
                    style: textStyle3(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

ElevatedButton quantityChangerButton(icon, onTap){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      shape: const CircleBorder(),
      padding: EdgeInsets.zero,
    ),
    onPressed: onTap,
    child: Icon(
      icon,
      color: Colors.grey,
      size: 26,
    ),
  );
}