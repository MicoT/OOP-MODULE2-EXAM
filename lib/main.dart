import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/auth_screen.dart';
import 'package:my_app/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme:
              GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.grey),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
