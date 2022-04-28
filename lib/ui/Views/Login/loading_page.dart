import 'package:e_commers/Bloc/auth/auth_bloc.dart';
import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Login/login_page.dart';
import 'package:e_commers/ui/themes/colors_custom.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Screens2/Home/home_screen.dart';


class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    _animation = Tween<double>(begin: 1.0, end: 0.8).animate(_animationController);

    _animation.addStatusListener( _animationListener );

    _animationController.forward();
  }

  _animationListener(AnimationStatus status){

    if( status == AnimationStatus.completed ){
        _animationController.reverse();
    }else if( status == AnimationStatus.dismissed ) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.removeStatusListener( _animationListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if( state is LogOutState  ){
          
          Navigator.of(context).pushAndRemoveUntil(routeFade(page: SignInPage()), (_) => false);
        
        } else if ( state is SuccessAuthState){
          
          userBloc.add( OnGetUserEvent() );
          Navigator.of(context).pushAndRemoveUntil(routeSlide(page: HomeScreen()), (_) => false);
        } 
      },
      child: Scaffold(
        backgroundColor: ColorsCustom.bgcolor,
        body: Center(
          child: SizedBox(
            height: 212,
            width: 181,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _animationController, 
                  builder: (_, child) => Transform.scale(
                    scale: _animation.value,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Custom_Text(text: 'Grocery Market', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, ),
                // const Custom_Text(text: 'Welcome to Grocery Market', color: Colors.white60 ),
              ],
            ),
          )
        ),
       ),
    );
  }
}