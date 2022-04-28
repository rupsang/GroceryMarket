import 'package:e_commers/Bloc/auth/auth_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/validation_form.dart';
import 'package:e_commers/ui/Views/Home/home_page.dart';
import 'package:e_commers/ui/widgets/notification.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Login/loading_page.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../Screens2/Home/home_screen.dart';
import '../../../ui/themes/colors_custom.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passowrdController;
  final _keyForm = GlobalKey<FormState>();
  bool isChangeSuffixIcon = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passowrdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    _passowrdController.clear();
    _passowrdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userBloc = BlocProvider.of<UserBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          modalLoading(context, 'Checking...');
        } else if (state is FailureAuthState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SuccessAuthState) {
          Navigator.pop(context);
          AwesomeNotifications().createNotification(
              content: NotificationContent(
                  id: 1,
                  channelKey: 'key1',
                  title: 'Loggin',
                  body: 'Logged in to Grocery Market'));
          userBloc.add(OnGetUserEvent());
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: HomeScreen()), (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Form(
            key: _keyForm,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              physics: BouncingScrollPhysics(),
              children: [
                // const SizedBox(height: 40),
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
                const Custom_Text(
                    text: 'Sign In',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: ColorsCustom.kprimaryColor),
                const SizedBox(height: 35),
                TextForm(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: validatedEmail,
                  hintText: 'Enter your Email ID',
                  prefixIcon: Icon(
                    Icons.alternate_email_rounded,
                    color: ColorsCustom.bgcolor,
                  ),
                ),
                const SizedBox(height: 20),
                TextForm(
                  controller: _passowrdController,
                  isPassword: isChangeSuffixIcon,
                  hintText: 'Enter your password',
                  prefixIcon: Icon(
                    Icons.password_rounded,
                    color: ColorsCustom.bgcolor,
                  ),
                  validator: passwordValidator,
                ),
                const SizedBox(height: 40),
                Btn_Custom(
                  text: 'Log In',
                  width: size.width,
                  fontSize: 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                            id: 1,
                            channelKey: 'key1',
                            title: 'Loggin',
                            body: 'Logged in to Grocery Market'));

                    // if (_keyForm.currentState!.validate()) {

                    //   authBloc.add(LoginEvent(_emailController.text.trim(),
                    //       _passowrdController.text.trim()));
                    // }
                  },
                  // onPressed: () => NotificationApi.showNotification(
                  //     title: "note", body: "hello world"),
                ),
                // ElevatedButton(
                //     onPressed: () => NotificationApi.showNotification(
                //         title: "note", body: "hello world"),
                //     child: Text("HELLO")),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      child: Custom_Text(
                          text: 'Forgot password?',
                          color: ColorsCustom.bgcolor,
                          fontSize: 16),
                      onPressed: () {}),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
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
                        Navigator.of(context)
                            .pushReplacementNamed('signUpPage');
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: ColorsCustom.kprimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late FlutterLocalNotificationsPlugin fltrNotification;

//   @override
//   void initState() {
//     super.initState();
//     var androidInitilize = new AndroidInitializationSettings('ic_launcher');
//     var iOSinitialize = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: androidInitilize, iOS: iOSinitialize);
//     fltrNotification = new FlutterLocalNotificationsPlugin();
//     fltrNotification.initialize(initializationSettings,
//         onSelectNotification: notificationSelected);
//   }

//   Future _showNotification() async {
//     var androidDetails = new AndroidNotificationDetails("channelId", "channelName", importance: Importance.max, priority: Priority.max);
//     var iOSDetails = new IOSNotificationDetails();
//     var generateNotificationDetails = new NotificationDetails(android: androidDetails,iOS: iOSDetails );

//     await fltrNotification.show(0, "title", "body", generateNotificationDetails);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ElevatedButton(
//         onPressed: _showNotification,
//         child: Text("hello"),
//       ),
//     ));
//   }

//   Future notificationSelected(payload) async {}
// }
