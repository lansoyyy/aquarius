import 'package:aquarius/screens/auth/login_screen.dart';
import 'package:aquarius/screens/home_screen.dart';
import 'package:aquarius/services/add_user.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/textField_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final pondSizeController = TextEditingController();

  var dropItems = ['Lato', 'Tilapia', 'Bangus', 'Pansat', 'Alimango'];

  var dropDownValue = 1;

  var org = 'Lato';

  String verID = " ";

  int screenState = 0;

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
        setState(() {
          screenState = 1;
        });
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

  String otpPin = " ";

  Future<void> verifyOTP() async {
    try {
      await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verID,
          smsCode: otpPin,
        ),
      );
      addUser(firstNameController.text, lastNameController.text,
          phoneController.text, pondSizeController.text, org);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: TextRegular(
              text: 'Invalid! Cannot Procceed',
              fontSize: 14,
              color: Colors.white),
        ),
      );
    }
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
              child: screenState == 0
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        Image.asset(
                          'assets/images/aquarius.png',
                          width: 280,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                            label: 'Phone Number', controller: phoneController),
                        TextFieldWidget(
                            label: 'First Name',
                            controller: firstNameController),
                        TextFieldWidget(
                            label: 'Last Name', controller: lastNameController),
                        TextFieldWidget(
                            isObscure: true,
                            label: 'Password',
                            controller: passwordController),
                        TextFieldWidget(
                            label: 'Fishpond Size (Ha)',
                            controller: pondSizeController),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegular(
                                  text: 'Domesticated Aquatic Organism',
                                  fontSize: 12,
                                  color: Colors.white),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 2, 20, 2),
                                  child: DropdownButton(
                                    underline:
                                        Container(color: Colors.transparent),
                                    iconEnabledColor: Colors.black,
                                    isExpanded: true,
                                    value: dropDownValue,
                                    items: [
                                      for (int i = 0; i < dropItems.length; i++)
                                        DropdownMenuItem(
                                          onTap: () {
                                            org = dropItems[i];
                                          },
                                          value: i,
                                          child: Center(
                                              child: Row(children: [
                                            Text(dropItems[i],
                                                style: const TextStyle(
                                                  fontFamily: 'QBold',
                                                  color: Colors.grey,
                                                ))
                                          ])),
                                        ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        dropDownValue =
                                            int.parse(value.toString());
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                            label: 'Sign Up',
                            onPressed: (() {
                              if (screenState == 0) {
                                if (phoneController.text.isEmpty) {
                                } else {
                                  verifyPhone(phoneController.text);
                                }
                              } else {
                                if (otpPin.length >= 6) {
                                  verifyOTP();
                                }
                              }
                            }),
                            buttonColor: primary),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextRegular(
                                fw: FontWeight.w700,
                                text: "Already have an account?",
                                fontSize: 14,
                                color: Colors.white),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: (() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                }),
                                child: TextBold(
                                    text: "Log In",
                                    fontSize: 18,
                                    color: Colors.white)),
                          ],
                        ),
                      ],
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "We just sent a code to ",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black87,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: phoneController.text,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "\nEnter the code here and we can continue!",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              onChanged: (value) {
                                setState(() {
                                  otpPin = value;
                                });
                              },
                              pinTheme: PinTheme(
                                activeColor: Colors.blue,
                                selectedColor: Colors.blue,
                                inactiveColor: Colors.black26,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonWidget(
                              label: 'Continue',
                              onPressed: (() {
                                if (screenState == 0) {
                                  if (phoneController.text.isEmpty) {
                                  } else {
                                    verifyPhone(phoneController.text);
                                  }
                                } else {
                                  if (otpPin.length >= 6) {
                                    verifyOTP();
                                  }
                                }
                              }),
                              buttonColor: primary),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn't receive the code? ",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black87,
                                    fontSize: 12,
                                  ),
                                ),
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        screenState = 0;
                                      });
                                    },
                                    child: Text(
                                      "Resend",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black87,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}
