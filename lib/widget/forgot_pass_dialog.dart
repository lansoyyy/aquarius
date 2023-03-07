import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({Key? key}) : super(key: key);

  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final _phoneController = TextEditingController();
  String _password = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Forgot Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
          ),
          const SizedBox(height: 16),
          MaterialButton(
              minWidth: 150,
              color: primary,
              onPressed: () {
                // Check if the phone number is correct
                if (_phoneController.text == box.read('phone')) {
                  setState(() {
                    _password = box.read('password'); // Display dummy data
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid phone number')),
                  );
                }
              },
              child: TextRegular(
                  text: 'Submit', fontSize: 18, color: Colors.white)),
          const SizedBox(height: 16),
          if (_password.isNotEmpty) Text('Your password is: $_password'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
