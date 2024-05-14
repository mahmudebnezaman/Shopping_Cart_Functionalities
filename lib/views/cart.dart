import 'package:cart_functionalities/const/strings.dart';
import 'package:cart_functionalities/views/widgets/customAlertDialog.dart';
import 'package:cart_functionalities/views/widgets/customBottom.dart';
import 'package:cart_functionalities/views/widgets/itemCard.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  int? total = 0;

  @override
  void initState() {
    countTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: const [
          Icon(Icons.search_rounded),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation){
          return Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  myBag,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomHeightSpacer(),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: cartData.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        CustomHeightSpacer(),
                    itemBuilder: (BuildContext context, int index) {
                      return itemCard(
                        context: context,
                        itemImage: cartData[index]['image'],
                        itemTitle: cartData[index]['title'],
                        itemColor: cartData[index]['color'],
                        itemSize: cartData[index]['size'],
                        itemQuantity: cartData[index]['quantity'].toString(),
                        itemPrice: cartData[index]['price'].toString(),
                        addFunction: () => addFunction(index, orientation),
                        subFunction: () => subFunction(index),
                        orientation: orientation,
                      );
                    },
                  ),
                ),
                customBottom(
                  context: context,
                  total: total,
                  orientation: orientation,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void countTotal() {
    total = 0;
    for (var i in cartData) {
      total = (total! + (i['price'] * i['quantity'])) as int?;
    }
  }

  void addFunction(int index, orientation) {
    if (cartData[index]['quantity'] < 5) {
      cartData[index]['quantity'] += 1;
      countTotal();
      setState(() {});
    } else if (cartData[index]['quantity'] == 5) {
      showDialog(
        context: context,
        builder: (context) {
          return customAlertDialog(
            context: context,
            title: 'Congratulations!',
            content:
                'You have added\n5\n ${cartData[index]['title']}in your bag!',
            orientation: orientation,
          );
        },
      );
    }
  }

  void subFunction(index) {
    if (cartData[index]['quantity'] > 0) {
      cartData[index]['quantity'] -= 1;
      countTotal();
      setState(() {});
    }
  }

  Widget CustomHeightSpacer() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.01,
    );
  }
}
