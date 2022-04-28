import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:e_commers/constants.dart';
import 'package:e_commers/Screens2/login_signup/signup_screen.dart';
import 'package:e_commers/Screens2/Home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// now it is responsive
//now we make our app home screen
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _size.height * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
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
              if (_formKey.currentState!.validate()) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }
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
