import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? buttonColor;
  final VoidCallback onPressed;

  const ButtonWidget(
      {required this.label,
      required this.onPressed,
      this.labelColor = Colors.white,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      color: buttonColor,
      minWidth: 300,
      height: 45,
      onPressed: (onPressed),
      child: TextBold(text: label, fontSize: 18, color: labelColor!),
    );
  }
}
