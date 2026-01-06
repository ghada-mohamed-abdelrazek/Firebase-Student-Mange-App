import 'package:flutter/material.dart';
import 'package:login_signup_flutter_firebase/auth/view/login.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    Future.delayed(
        Duration(seconds: 6),()async{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              }));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Lottie.asset("assets/json/splash_sceen.json"),
      ),
    );

  }
}
