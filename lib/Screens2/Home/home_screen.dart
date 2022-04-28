import 'dart:async';

import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commers/Screens2/Home/widgets/banner.dart';
import 'package:e_commers/constants.dart';
import '../../ui/Views/Login/login_page.dart';
import '../../ui/Views/Profile/add_product/add_product_page.dart';
import '../login_signup/login_screen.dart';
import 'products/product_section.dart';
import 'widgets/bottomnav.dart';
import 'widgets/menu.dart';
import 'package:shake/shake.dart';
import 'package:all_sensors/all_sensors.dart';
import 'package:motion_toast/motion_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<StreamSubscription<dynamic>> _streamSubscriptions =
  //     <StreamSubscription<dynamic>>[];
  // final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShakeDetector.autoStart(onPhoneShake: () {
      print("shake sensor works ...");
      MotionToast.info(
        description: Text(
          "You are in homepage",
        ),
        toastDuration: Duration(seconds: 1),
        animationDuration: Duration(milliseconds: 200),
      ).show(context);
    });

    _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
      if (event.getValue() == true) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // shape: RoundedRectangleBorder(),
            // title: const Icon(Icons.abc),
            content: const Text("Log Out from Grocery Market?",
                style: TextStyle(
                    color: kSecondaryColor, fontWeight: FontWeight.bold)),
            actions: [
              ElevatedButton(
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  }),
                  child: const Text("YES"),
                  style: ElevatedButton.styleFrom(primary: kSecondaryColor)),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  child: const Text("NO"),
                  style: ElevatedButton.styleFrom(primary: kSecondaryColor)),
            ],
          ),
        );
      }
    }));
  }

//  _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
//       if (event.getValue() == true) {
//         print("App is closed");
//         exit(0);
//       }
//     }));
//   }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      //scrollable widget
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  MenuItems(
                    isActive: true,
                    title: 'Home',
                    press: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // MenuItems(
                  //   title: 'Products',
                  //   press: () {},
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  MenuItems(
                      title: 'Add Products',
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProductPage()));
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  MenuItems(
                    title: 'Sign Out',
                    press: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                // shape: RoundedRectangleBorder(),
                                // title: const Icon(Icons.abc),
                                content: const Text("Log Out from Grocery Market?",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold)),
                                actions: [
                                  ElevatedButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()));
                                      }),
                                      child: const Text("YES"),
                                      style: ElevatedButton.styleFrom(
                                          primary: kSecondaryColor)),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                      onPressed: (() {
                                        Navigator.pop(context);
                                      }),
                                      child: const Text("NO"),
                                      style: ElevatedButton.styleFrom(
                                          primary: kSecondaryColor)),
                                ],
                              ));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const LoginScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            //now we create menu and header
            Navigation(),
            //now we create banner
            //for this import packages
            HeroBanner(),
            ProductSection(),
            BottomNav()
            //now we will make our site responsive
          ],
        ),
      ),
    );
  }
}
