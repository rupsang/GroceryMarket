import 'package:flutter/material.dart';
import 'package:e_commers/constants.dart';
import 'package:e_commers/responsive.dart';

import 'dairy_product.dart';
import 'vegetables_products.dart';
import 'fruits_products.dart';

class AllBrandsProduct extends StatefulWidget {
  const AllBrandsProduct({Key? key}) : super(key: key);

  @override
  _AllBrandsProductState createState() => _AllBrandsProductState();
}

class _AllBrandsProductState extends State<AllBrandsProduct> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TabBar(
                indicatorColor: kPrimaryColor,
                unselectedLabelColor: Colors.black,
                labelColor: kPrimaryColor,
                indicatorWeight: 2.0,
                unselectedLabelStyle: TextStyle(
                  fontSize: _size.width >= 414 ? 18 : 12,
                ),
                labelStyle: TextStyle(
                  fontSize: _size.width >= 414 ? 18 : 12,
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    text: "Vegetables",
                  ),
                  Tab(
                    text: "Fruits",
                  ),
                  Tab(
                    text: "Dairy",
                  ),
                ]),
            if (Responsive.isDesktop(context))
              Container(
                height: 350,
                child: const TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: iPhoneProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: SamsungProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: HeadPhoneProductCard(),
                    ),
                  ],
                ),
              ),
            if (!Responsive.isDesktop(context))
              Container(
                height: 600,
                child: const TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobiPhoneProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobSamsungProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobHeadPhoneProductCard(),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
