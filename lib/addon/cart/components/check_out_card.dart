import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../ui/Views/cart/checkout_page.dart';
import '../../../ui/widgets/widgets.dart';
import '../../Cart.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Text(
                  "Items in Cart: ${demoCarts.length} items",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: ColorsCustom.ksecundaryColor),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                // Text("Add voucher code"),
                // const SizedBox(width: 10),
                // Icon(
                //   Icons.arrow_forward_ios,
                //   size: 12,
                //   color: ColorsCustom.bgcolor,
                // )
              ],
            ),
            // SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: Btn_Custom(
                    text: 'Checkout',
                    width: 20,
                    fontSize: 20,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutPage()));
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text.rich(

                //   TextSpan(
                //     text: "Total Price:\n",
                //     style: TextStyle(
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold,
                //         color: kSecondaryColor),
                //     children: [
                //       TextSpan(
                //         text: "  \Rs 200",
                //         style: TextStyle(fontSize: 20, color: kPrimaryColor),
                //       ),
                //     ],
                //   ),
                // ),
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CheckOutPage()));
              ],
            ),
          ],
        ),
      ),
    );
  }
}
