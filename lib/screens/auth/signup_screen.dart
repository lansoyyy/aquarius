import 'package:aquarius/screens/auth/login_screen.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/textField_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

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
              TextFieldWidget(label: 'First Name', controller: phoneController),
              TextFieldWidget(label: 'Last Name', controller: phoneController),
              TextFieldWidget(
                  isObscure: true,
                  label: 'Password',
                  controller: passwordController),
              TextFieldWidget(
                  label: 'Fishpond Size (Ha)', controller: phoneController),
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
                        padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                        child: DropdownButton(
                          underline: Container(color: Colors.transparent),
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
                              dropDownValue = int.parse(value.toString());
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
                  label: 'Sign Up', onPressed: (() {}), buttonColor: primary),
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
                      text: "Already have an account?",
                      fontSize: 14,
                      color: Colors.white),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: (() {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                      child: TextBold(
                          text: "Log In", fontSize: 18, color: Colors.white)),
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
