import 'package:flutter/material.dart';
import 'package:e_commers/constants.dart';

import 'menu.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      color: kgreyColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/logo.png",
                          cacheHeight: 40,
                          cacheWidth: 40,
                        ),
                      ),
                    ),
                    Spacer(),
                    _size.width >= 550 ? WebMenu() : MobMenu(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
