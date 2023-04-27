import 'package:aquarius/screens/auth/signup_screen.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/forgot_pass_dialog.dart';
import 'package:aquarius/widget/textField_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  String verID = " ";

  final box = GetStorage();

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        // Fluttertoast.showToast(msg: 'Completed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextRegular(
                text: 'OTP Completed', fontSize: 14, color: Colors.white),
          ),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        // Fluttertoast.showToast(msg: 'Failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                TextRegular(text: 'Failed', fontSize: 14, color: Colors.white),
          ),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: TextRegular(
                text: 'OTP Sent', fontSize: 14, color: Colors.white),
          ),
        );
        verID = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Fluttertoast.showToast(msg: 'Timeout');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                TextRegular(text: 'Timeout', fontSize: 14, color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: 500,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextFormField(
                    controller: phoneController,
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'QRegular'),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: primary),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Phone Number',
                      labelStyle: const TextStyle(
                        fontFamily: 'QBold',
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      hintText: 'ie: +639XXXXXXXXX',
                      hintStyle: const TextStyle(
                        fontFamily: 'QRegular',
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                TextFieldWidget(
                    showEye: true,
                    isObscure: true,
                    label: 'Password',
                    controller: passwordController),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    label: 'Log In',
                    onPressed: (() async {
                      // verifyPhone(phoneController.text);

                      // if (box.read('phone') != phoneController.text &&
                      //     box.read('password') != passwordController.text) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: TextRegular(
                      //           text: 'Invalid Account!',
                      //           fontSize: 14,
                      //           color: Colors.white),
                      //     ),
                      //   );
                      // } else {
                      //   Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeScreen(),
                      //     ),
                      //   );
                      // }

                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: '${phoneController.text.trim()}@user.com',
                            password: passwordController.text);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: TextRegular(
                                text: e.toString(),
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        );
                      }
                    }),
                    buttonColor: primary),
                TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const ForgotPasswordDialog();
                          });
                    },
                    child: TextRegular(
                        text: 'Forgot Password?',
                        fontSize: 14,
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
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        }),
                        child: TextBold(
                            text: "Sign Up",
                            fontSize: 18,
                            color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 125,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
