import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change Password'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'New Password',
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              _changePassword(_phoneController.text);
              box.write('password', _phoneController.text);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password Updated!')),
              );
              Navigator.pop(context);
            },
            child: TextBold(text: 'Update', fontSize: 18, color: primary)),
      ],
    );
  }

  void _changePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: box.read('password'));

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
        print('password changed');
      }).catchError((error) {
        //Error, show something
        print('invalid');
      });
    }).catchError((err) {
      print('invalid');
    });
  }
}
