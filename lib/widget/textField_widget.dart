import 'package:aquarius/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool? isObscure;

  const TextFieldWidget(
      {required this.label, required this.controller, this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure!,
        style: const TextStyle(color: Colors.black, fontFamily: 'QRegular'),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: primary),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: label,
          hintStyle: const TextStyle(
            fontFamily: 'QBold',
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
