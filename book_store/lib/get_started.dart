import 'package:flutter/material.dart';
import 'dart:async';
import 'sign_in&sign_up.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset(
                'assets/logo.png', 
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 20),
            const Text(
              'READ & GROW',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5CE1E6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

