import 'package:e_commers/Screens2/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commers/ui/Views/Login/login_page.dart';
import 'package:e_commers/ui/Views/Login/loading_page.dart';
import 'package:e_commers/ui/Views/Login/register_page.dart';
import 'package:e_commers/ui/Views/Start/start_home_page.dart';

import '../ui/Views/Home/home_page.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  'loadingPage': (context) => LoadingPage(),
  'getStarted': (context) => StartHomePage(),
  'signInPage': (context) => SignInPage(),
  'signUpPage': (context) => SignUpPage(),
  'homePage': (context) => HomePage(),
  'newHomePage': (context) => HomeScreen(),
  // 'cartPage'      : ( context ) => CartPage(),
  // 'favoritePage'  : ( context ) => FavoritePage(),
  // 'profilePage'   : ( context ) => ProfilePage(),
};
