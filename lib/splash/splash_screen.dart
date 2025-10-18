import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_screen/auth/login_screen.dart';
import 'package:splash_screen/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF016ED7), Color(0xFFFFFFFF)],
            stops: [0.0276, 1.1251],
            transform: GradientRotation(121.12 * 3.1416 / 180),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            imagePath + "Frame.svg",
            width: 127,
            height: 106,
          ),
        ),
      ),
    );
  }
}
