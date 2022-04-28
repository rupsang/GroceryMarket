import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:e_commers/constants.dart';

import 'home_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmpasswordTextController = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  bool isvisible = true;
  bool confirmisvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded,
                            color: Colors.black87),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 20),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    const Text(
                      "Grocery Market",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Your Profile",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        // color: kgreyColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person_outline,
                            color: kTextGrayColor,
                          ),
                          hintText: "rupsang",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        // color: kgreyColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: kTextGrayColor,
                          ),
                          hintText: "rupsang@gmail.com",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //password field
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        // color: kgreyColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.map,
                            color: kTextGrayColor,
                          ),
                          hintText: "enter your shipping address",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //confirm password field
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        // color: kgreyColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone,
                            color: kTextGrayColor,
                          ),
                          hintText: "enter your contact info",
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //sign Up Button
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  // shape: RoundedRectangleBorder(),
                                  // title: const Icon(Icons.abc),
                                  content: const Text("Profile Updated",
                                      style: TextStyle(
                                          color: ColorsCustom.bgcolor,
                                          fontWeight: FontWeight.bold)),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: (() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen()));
                                        }),
                                        child: const Text("Ok"),
                                        style: ElevatedButton.styleFrom(
                                            primary: ColorsCustom.bgcolor)),
                                  ],
                                ));
                      },
                      child: const Text(
                        "Update Info",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
