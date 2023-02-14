import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/textField_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
            children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset(
                'assets/images/aquarius.png',
                width: 280,
              ),
              const SizedBox(
                height: 120,
              ),
              TextFieldWidget(
                  label: 'Phone Number', controller: phoneController),
              TextFieldWidget(
                  isObscure: true,
                  label: 'Password',
                  controller: passwordController),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  label: 'Log In', onPressed: (() {}), buttonColor: primary),
              TextButton(
                  onPressed: (() {}),
                  child: TextRegular(
                      fw: FontWeight.w700,
                      text: 'Forgot Password?',
                      fontSize: 15,
                      color: Colors.white)),
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextRegular(
                      fw: FontWeight.w700,
                      text: "Don't have an account?",
                      fontSize: 14,
                      color: Colors.white),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: (() {}),
                      child: TextBold(
                          text: "Sign Up", fontSize: 18, color: Colors.white)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
