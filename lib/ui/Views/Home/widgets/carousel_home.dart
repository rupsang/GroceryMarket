import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commers/Models/Response/response_slide_products.dart';
import 'package:e_commers/Service/product_services.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/widgets/shimmer_custom.dart';
import 'package:flutter/material.dart';


class HeroBanner extends StatefulWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  _HeroBannerState createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider(
            items: [
              Image.asset("assets/banner_3.png"),
              Image.asset("assets/banner_1.png"),
              Image.asset("assets/banner_2.png"),
              Image.asset("assets/banner_4.png"),
            ],
            options: CarouselOptions(
                height: _size.width == 300
                    ? 250
                    : _size.width >= 500
                        ? 500
                        : 300,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int p, CarouselPageChangedReason) {
                  setState(() {
                    index = p;
                  });
                })),
        // DotsIndicator(
        //   dotsCount: 4,
        //   position: index.toDouble(),
        //   decorator: DotsDecorator(
        //     activeColor: kPrimaryColor.withOpacity(0.5),
        //     size: const Size.square(9.0),
        //     activeSize: const Size(18.0, 9.0),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0)),
        //   ),
        // )
      ],
    );
  }
}
