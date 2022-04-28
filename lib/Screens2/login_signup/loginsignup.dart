import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:e_commers/constants.dart';
import 'package:email_validator/email_validator.dart';
class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.fitWidth)),
              child: Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                color: Color(0xFF8FBC8F).withOpacity(.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Logo",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Color(0xffffffff),
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen
                                  ? " Grocery Market"
                                  : " Grocery Market",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff)),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   isSignupScreen
                    //       ? "Your grocery shopping made easy"
                    //       : "Your grocery shopping made easy",
                    //   style: TextStyle(
                    //     letterSpacing: 1,
                    //     color: Colors.grey,
                    //     fontSize: 12
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          // buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOG IN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? kTextGrayColor
                                        : kPrimaryColor),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.green,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGN UP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? kTextGrayColor
                                        : kPrimaryColor),
                              ),
                              if (isSignupScreen)
                                Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.green)
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          // buildBottomHalfContainer(false),
          // Bottom buttons
        ],
      ),
    );
  }

  Scaffold buildSigninSection() {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
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
                    "Log in",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextFields(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          color: kTextGrayColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => const SignUpScreen(),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text(
                      //     "Sign Up",
                      //     style: TextStyle(
                      //         color: kPrimaryColor,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 20),
                      //   ),
                      // ),
                    ],
                  ),
                  // SizedBox(
                  //   height: _size.height * 0.1,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
          // children: [
          //   buildTextField(MaterialCommunityIcons.account_outline, "User Name",
          //       false, false),
          //   buildTextField(
          //       MaterialCommunityIcons.email_outline, "email", false, true),
          //   buildTextField(
          //       MaterialCommunityIcons.lock_outline, "password", true, false),
          //   Padding(
          //     padding: const EdgeInsets.only(top: 10, left: 10),
          //     child: Row(
          //       children: [
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               isMale = true;
          //             });
          //           },
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 margin: EdgeInsets.only(right: 😎,
          //                 decoration: BoxDecoration(
          //                     color: isMale
          //                         ? Palette.textColor2
          //                         : Colors.transparent,
          //                     border: Border.all(
          //                         width: 1,
          //                         color: isMale
          //                             ? Colors.transparent
          //                             : Palette.textColor1),
          //                     borderRadius: BorderRadius.circular(15)),
          //                 child: Icon(
          //                   MaterialCommunityIcons.account_outline,
          //                   color: isMale ? Colors.white : Palette.iconColor,
          //                 ),
          //               ),
          //               Text(
          //                 "Male",
          //                 style: TextStyle(color: Palette.textColor1),
          //               )
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           width: 30,
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               isMale = false;
          //             });
          //           },
          //           child: Row(
          //             children: [
          //               Container(
          //                 width: 30,
          //                 height: 30,
          //                 margin: EdgeInsets.only(right: 😎,
          //                 decoration: BoxDecoration(
          //                     color: isMale
          //                         ? Colors.transparent
          //                         : Palette.textColor2,
          //                     border: Border.all(
          //                         width: 1,
          //                         color: isMale
          //                             ? Palette.textColor1
          //                             : Colors.transparent),
          //                     borderRadius: BorderRadius.circular(15)),
          //                 child: Icon(
          //                   MaterialCommunityIcons.account_outline,
          //                   color: isMale ? Palette.iconColor : Colors.white,
          //                 ),
          //               ),
          //               Text(
          //                 "Female",
          //                 style: TextStyle(color: Palette.textColor1),
          //               )
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),

          //   ),

          //   Container(
          //     width: 200,
          //     margin: EdgeInsets.only(top: 20),
          //     child: RichText(
          //       textAlign: TextAlign.center,
          //       text: TextSpan(
          //           text: "By pressing 'Submit' you agree to our ",
          //           style: TextStyle(color: Palette.textColor2),
          //           children: [
          //             TextSpan(
          //               //recognizer: ,
          //               text: "term & conditions",
          //               style: TextStyle(color: Colors.orange),
          //             ),
          //           ]),
          //     ),
          //   ),
          // ],

          ),
    );
  }

  // TextButton buildTextButton(
  //     IconData icon, String title, Color backgroundColor) {
  //   return TextButton(
  //     onPressed: () {},
  //     style: TextButton.styleFrom(
  //         side: BorderSide(width: 1, color: Colors.grey),
  //         minimumSize: Size(145, 40),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         primary: Colors.white,
  //         backgroundColor: backgroundColor),
  //     child: Row(
  //       children: [
  //         Icon(
  //          icon,
  //         ),
  //         SizedBox(
  //           width: 5,
  //         ),
  //         Text(
  //           title,
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget buildBottomHalfContainer(bool showShadow) {
  //   return AnimatedPositioned(
  //     duration: Duration(milliseconds: 700),
  //     curve: Curves.bounceInOut,
  //     top: isSignupScreen ? 535 : 430,
  //     right: 0,
  //     left: 0,
  //     child: Center(
  //       child: Container(
  //         height: 90,
  //         width: 90,
  //         padding: EdgeInsets.all(15),
  //         decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(50),
  //             boxShadow: [
  //               if (showShadow)
  //                 BoxShadow(
  //                   color: Colors.black.withOpacity(.3),
  //                   spreadRadius: 1.5,
  //                   blurRadius: 10,
  //                 )
  //             ]),
  //         child: !showShadow
  //             ? Container(
  //                 decoration: BoxDecoration(
  //                     gradient: LinearGradient(
  //                         colors: [Colors.orange[200], Colors.red[400]],
  //                         begin: Alignment.topLeft,
  //                         end: Alignment.bottomRight),
  //                     borderRadius: BorderRadius.circular(30),
  //                     boxShadow: [
  //                       BoxShadow(
  //                           color: Colors.black.withOpacity(.3),
  //                           spreadRadius: 1,
  //                           blurRadius: 2,
  //                           offset: Offset(0, 1))
  //                     ]),
  //                 child: Icon(
  //                   Icons.arrow_forward,
  //                   color: Colors.white,
  //                 ),
  //               )
  //             : Center(),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildTextField(
  //     IconData icon, String hintText, bool isPassword, bool isEmail) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: TextField(
  //       obscureText: isPassword,
  //       keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(
  //           icon,
  //           color: Palette.iconColor,
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Palette.textColor1),
  //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Palette.textColor1),
  //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
  //         ),
  //         contentPadding: EdgeInsets.all(10),
  //         hintText: hintText,
  //         hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildTextField(
  //     IconData icon, String hintText, bool isPassword, bool isEmail) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: Text(
  //       "hello",
  //       style: TextStyle(letterSpacing: 1, color: Colors.grey, fontSize: 12),
  //     ),
  //   );
  // }
}
class TextFields extends StatefulWidget {
  const TextFields({
    Key? key,
  }) : super(key: key);

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final _formKey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //email
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              // color: kgreyColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
              controller: emailTextController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Email";
                }
                //now we use email validator package
                final bool _isvalid =
                    EmailValidator.validate(emailTextController.text);
                if (!_isvalid) {
                  return "Email was entered incorrectly";
                }
                return null;
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: kTextGrayColor,
                ),
                hintText: "Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                iconColor: kPrimaryColor,
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
              obscureText: isvisible,
              controller: passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter Password";
                }

                return null;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isvisible = !isvisible;
                    });
                  },
                  icon: isvisible == true
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  color: isvisible == true ? kTextGrayColor : kTextGrayColor,
                ),
                hintText: "Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          //forgot button

          const SizedBox(
            height: 30,
          ),
          // login button
          MaterialButton(
            color: kPrimaryColor,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            height: 50,
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => HomeScreen()));
              // }
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
