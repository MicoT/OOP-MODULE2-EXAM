import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 4000), () {});
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 850),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secAnimation) {
            return AuthScreen();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252525),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 120),
              child: Image.asset(
                'assets/DBP-clear.png',
                scale: 20,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'MOBILE BANKING',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'roboto',
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
