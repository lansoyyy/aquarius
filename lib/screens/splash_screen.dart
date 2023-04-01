import 'dart:async';

import 'package:aquarius/screens/auth/login_screen.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Image.asset(
                'assets/images/logo.png',
                height: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/aquarius.png',
                width: 280,
              ),
              const SizedBox(
                height: 300,
              ),
              TextRegular(
                  text: 'University of Cebu Lapu-Lapu and Mandaue',
                  fontSize: 15,
                  color: Colors.white),
              const SizedBox(
                height: 10,
              ),
              TextRegular(
                  text: 'Amores, Arreglo, Basmayor, Gonzales, Puerto',
                  fontSize: 12,
                  color: Colors.white60),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
