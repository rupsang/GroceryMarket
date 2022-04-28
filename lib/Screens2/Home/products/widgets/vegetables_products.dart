import 'package:flutter/material.dart';
import 'package:e_commers/constants.dart';
import 'package:e_commers/model2/vegetables_model.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class iPhoneProductCard extends StatelessWidget {
  const iPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 4,
      itemCount: iPhoneProducts.length,
      itemBuilder: (BuildContext context, int index) => IphoneProducts(
        press: () {},
        iPhoneproduct: iPhoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class MobiPhoneProductCard extends StatelessWidget {
  const MobiPhoneProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 2,
      itemCount: iPhoneProducts.length,
      itemBuilder: (BuildContext context, int index) => IphoneProducts(
        press: () {},
        iPhoneproduct: iPhoneProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class IphoneProducts extends StatefulWidget {
  final IphoneProduct iPhoneproduct;
  final VoidCallback press;
  const IphoneProducts({
    Key? key,
    required this.iPhoneproduct,
    required this.press,
  }) : super(key: key);

  @override
  State<IphoneProducts> createState() => _IphoneProductsState();
}

class _IphoneProductsState extends State<IphoneProducts> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: kDefaultDuration,
          width: 500,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kgreyColor, width: 3),
              boxShadow: [if (isHover) kDefaultShadow]),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      widget.iPhoneproduct.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.iPhoneproduct.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\Rs ${widget.iPhoneproduct.price}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment,
                        children: [
                          const SizedBox(
                            width: 2,
                          ),
                          ElevatedButton(
                              onPressed: (() {}),
                              child: const Text("View"),
                              style: ElevatedButton.styleFrom(
                                  primary: kDarkgreyColor)),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: (() {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    // shape: RoundedRectangleBorder(),
                                    // title: const Icon(Icons.abc),
                                    content: const Text("Added to cart",
                                        style: TextStyle(
                                            color: kSecondaryColor,
                                            fontWeight: FontWeight.bold)),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: (() {
                                            Navigator.pop(context);
                                          }),
                                          child: const Text("Ok"),
                                          style: ElevatedButton.styleFrom(
                                              primary: kSecondaryColor)),
                                    ],
                                  ),
                                );
                              }),
                              child: const Text("Buy"),
                              style: ElevatedButton.styleFrom(
                                  primary: kDarkgreyColor))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              isHover
                  ? Container(
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            color: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            height: 40,
                            onPressed: () {},
                            child: const Text(
                              "Quick View",
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: kSecondaryColor,
                            height: 40,
                            onPressed: () {},
                            child: const Text(
                              "Shop Now",
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
