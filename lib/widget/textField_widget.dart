import 'package:aquarius/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  late bool? isObscure;
  late bool? showEye;
  final TextInputType? inputType;

  TextFieldWidget(
      {super.key,
      required this.label,
      required this.controller,
      this.isObscure = false,
      this.showEye = false,
      this.inputType = TextInputType.name});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: TextFormField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        obscureText: widget.isObscure!,
        style: const TextStyle(color: Colors.black, fontFamily: 'QRegular'),
        decoration: InputDecoration(
          suffixIcon: widget.showEye! == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isObscure = !widget.isObscure!;
                    });
                  },
                  icon: widget.isObscure!
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))
              : const SizedBox(),
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
          hintText: widget.label,
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
