import 'package:flutter/material.dart';
import '../Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Your Cart",
                  style: TextStyle(color: Colors.black),
                ),
                // Text(
                //   "${demoCarts.length} items",
                //   style: Theme.of(context).textTheme.caption,
                // ),
              ],
            ),
          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),

        ],
      ),
    );
  }
}
