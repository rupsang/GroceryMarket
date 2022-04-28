import 'package:flutter/material.dart';
import 'package:e_commers/Screens2/Home/products/widgets/dairy_product.dart';
import 'package:e_commers/Screens2/Home/products/widgets/fruits_products.dart';
import 'package:e_commers/Screens2/Home/widgets/menu.dart';
import 'package:e_commers/constants.dart';
import 'package:e_commers/model2/trending_model.dart';
import 'package:e_commers/responsive.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/allproducts.dart';
import 'widgets/category.dart';
import 'widgets/vegetables_products.dart';
import 'widgets/trending_products.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Our Organic Selection",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              // const Cateegory(),
              //trending product section
              const SizedBox(
                height: 20,
              ),
              if (Responsive.isDesktop(context)) const TrendingProductCard(),
              if (!Responsive.isDesktop(context)) const MobTrendingProduct(),

              //now we create trending Product model
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: kSecondaryColor, width: 3),
                  ),
                ),
                child: const Text(
                  "We Sell",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const AllBrandsProduct(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
