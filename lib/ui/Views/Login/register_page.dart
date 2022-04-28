import 'package:e_commers/Screens2/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Helpers/validation_form.dart';
import 'package:e_commers/ui/Views/Login/login_page.dart';
import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passowrdController;
  late TextEditingController passController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userController = TextEditingController();
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clear();
    userController.dispose();
    emailController.dispose();
    passowrdController.dispose();
    passController.dispose();
    super.dispose();
  }

  void clear() {
    userController.clear();
    emailController.clear();
    passowrdController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
   final userBloc = BlocProvider.of<UserBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if( state is LoadingUserState ){

          modalLoading(context, 'Validating...');
        }
        if( state is SuccessUserState ){
          
          Navigator.of(context).pop();
           AwesomeNotifications().createNotification(
                          content: NotificationContent(
                              id: 1,
                              channelKey: 'key1',
                              title: 'User Registered',
                              body:
                                  'Registered to LocalFarm'));
          modalSuccess(context,'USER CREATED', onPressed: (){
            clear();
            Navigator.pushReplacement(context, routeSlide(page: SignInPage()));
          });
        }
        if( state is FailureUserState ){

          Navigator.of(context).pop();
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo.png"),
              ),
              Center(
                child: const Custom_Text(
                    text: 'Grocery Market',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsCustom.kprimaryColor),
              ),
              const SizedBox(height: 20),
              Custom_Text(
                  text: 'Sign Up',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: ColorsCustom.kprimaryColor),
              SizedBox(height: 35),
              TextForm(
                hintText: 'Username',
                prefixIcon: Icon(
                  Icons.person,
                  color: ColorsCustom.bgcolor,
                ),
                controller: userController,
                validator: RequiredValidator(errorText: 'Username is required'),
              ),
              SizedBox(height: 15.0),
              TextForm(
                  hintText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: ColorsCustom.bgcolor,
                  ),
                  controller: emailController,
                  validator: validatedEmail),
              SizedBox(height: 15.0),
              TextForm(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.vpn_key_rounded,
                  color: ColorsCustom.bgcolor,
                ),
                isPassword: true,
                controller: passowrdController,
                validator: passwordValidator,
              ),
              SizedBox(height: 15.0),
              TextForm(
                  hintText: 'Repeat Password',
                  controller: passController,
                  prefixIcon: Icon(
                    Icons.vpn_key_rounded,
                    color: ColorsCustom.bgcolor,
                  ),
                  isPassword: true,
                  validator: (val) =>
                      MatchValidator(errorText: 'Password do not macth ')
                          .validateMatch(val!, passowrdController.text)),
              SizedBox(height: 25.0),
              Btn_Custom(
                text: 'Register',
                width: size.width,
                fontSize: 20,
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  SignInPage()));
                      //                 if (_keyForm.currentState!.validate()) {
                      // AwesomeNotifications().createNotification(
                      //     content: NotificationContent(
                      //         id: 1,
                      //         channelKey: 'key1',
                      //         title: 'Loggin',
                      //         body:
                      //             'Logged in to Grocery Market'));
                  // if (_formKey.currentState!.validate()) {
                  //   userBloc.add(OnAddNewUser(
                  //       userController.text.trim(),
                  //       emailController.text.trim(),
                  //       passowrdController.text.trim()));
                  // }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already Registered?",
                    style: TextStyle(
                      color: ColorsCustom.bgcolor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                        Navigator.of(context).pushReplacementNamed('signInPage');
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: ColorsCustom.kprimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                ],
              ),
              // const Custom_Text(
              //     text: 'Already have an account? ',
              //     fontSize: 20,
              //     color: ColorsCustom.kprimaryColor),
              // const SizedBox(height: 5),
              // Btn_Custom(
              //   text: 'Sign In',
              //   width: size.width,
              //   fontSize: 20,
              //   onPressed: () {
              //     Navigator.of(context).pushReplacementNamed('signInPage');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
