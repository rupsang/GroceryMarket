// import 'dart:io';
import 'package:e_commers/Bloc/General/general_bloc.dart';
import 'package:e_commers/ui/Views/Profile/add_product/add_product_page.dart';
import 'package:e_commers/ui/Views/Profile/card/credit_card_page.dart';
import 'package:e_commers/ui/Views/Profile/information_page.dart';
import 'package:e_commers/ui/Views/Profile/shopping/shopping_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Service/urls.dart';
import 'package:e_commers/ui/Views/Profile/widgets/card_item_profile.dart';
import 'package:e_commers/ui/Views/Profile/widgets/divider_line.dart';
import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:e_commers/ui/widgets/shimmer_custom.dart';
import 'package:e_commers/ui/widgets/widgets.dart';

import '../../../constants.dart';
import '../Login/login_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context, 'Loading...');
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SetUserState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        body: Stack(
          children: [
            ListProfile(),
            Positioned(
              bottom: 20,
              child: Container(
                  width: size.width,
                  child: Align(child: BottomNavigation(index: 5))),
            ),
          ],
        ),
      ),
    );
  }
}

class ListProfile extends StatefulWidget {
  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  late ScrollController _scrollController;
  double scrollPrevious = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(addListenerScroll);

    super.initState();
  }

  void addListenerScroll() {
    if (_scrollController.offset > scrollPrevious) {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: false));
    } else {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: true));
    }
    scrollPrevious = _scrollController.offset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(addListenerScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 35.0, bottom: 20.0),
      children: [
        BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) => state.user != null
                ? Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: state.user != null && state.user?.image == ''
                              ? GestureDetector(
                                  onTap: () => modalSelectPicture(
                                        context: context,
                                        onPressedImage: () async {
                                          Navigator.pop(context);
                                          AccessPermission()
                                              .permissionAccessGalleryOrCameraForProfile(
                                                  await Permission.storage
                                                      .request(),
                                                  context,
                                                  ImageSource.gallery);
                                        },
                                        onPressedPhoto: () async {
                                          Navigator.pop(context);
                                          AccessPermission()
                                              .permissionAccessGalleryOrCameraForProfile(
                                                  await Permission.camera
                                                      .request(),
                                                  context,
                                                  ImageSource.camera);
                                        },
                                      ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: ColorsCustom.kprimaryColor,
                                    child: Custom_Text(
                                        text: state.user!.users
                                            .substring(0, 2)
                                            .toUpperCase(),
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ))
                              : GestureDetector(
                                  onTap: () => modalSelectPicture(
                                    context: context,
                                    onPressedImage: () async {
                                      Navigator.pop(context);
                                      AccessPermission()
                                          .permissionAccessGalleryOrCameraForProfile(
                                              await Permission.storage
                                                  .request(),
                                              context,
                                              ImageSource.gallery);
                                    },
                                    onPressedPhoto: () async {
                                      Navigator.pop(context);
                                      AccessPermission()
                                          .permissionAccessGalleryOrCameraForProfile(
                                              await Permission.camera.request(),
                                              context,
                                              ImageSource.camera);
                                    },
                                  ),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(URLS.baseUrl +
                                                state.user!.image))),
                                  ),
                                )),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BounceInRight(
                            child: Align(
                                alignment: Alignment.center,
                                child: Custom_Text(
                                    text: state.user!.users,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500)),
                          ),
                          FadeInRight(
                            child: Align(
                                alignment: Alignment.center,
                                child: Custom_Text(
                                    text: state.user!.email,
                                    fontSize: 18,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                    ],
                  )
                : const CustomShimmer()),
        const SizedBox(height: 25.0),
        Center(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              children: [
                CardItemProfile(
                  text: 'Profile',
                  borderRadius: BorderRadius.circular(50.0),
                  icon: Icons.person_outline_rounded,
                  backgroundColor: ColorsCustom.bgcolor,
                  onPressed: () => Navigator.push(
                      context, routeSlide(page: InformationPage())),
                ),
                DividerLine(size: size),
                // CardItemProfile(
                //   text: 'Credit Card',
                //   borderRadius: BorderRadius.circular(50.0),
                //   icon: Icons.credit_card_rounded,
                //   backgroundColor: ColorsCustom.bgcolor,
                //   onPressed: () => Navigator.push(
                //       context, routeSlide(page: CreditCardPage())),
                // ),
                DividerLine(size: size),
                CardItemProfile(
                  text: 'Add Product',
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30.0)),
                  icon: Icons.add,
                  backgroundColor: ColorsCustom.bgcolor,
                  onPressed: () => Navigator.push(
                      context, routeSlide(page: AddProductPage())),
                ),
                CardItemProfile(
                  text: 'Shopping History',
                  backgroundColor: ColorsCustom.bgcolor,
                  icon: Icons.shopping_bag_outlined,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30.0)),
                  onPressed: () =>
                      Navigator.push(context, routeSlide(page: ShoppingPage())),
                ),
                CardItemProfile(
                  text: 'Sign Out',
                  borderRadius: BorderRadius.circular(50.0),
                  icon: Icons.power_settings_new_sharp,
                  backgroundColor: kSecondaryColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        // shape: RoundedRectangleBorder(),
                        // title: const Icon(Icons.abc),
                        content: const Text("Log Out from Grocery Market?",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                        actions: [
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInPage()));
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
