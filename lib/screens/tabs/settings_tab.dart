import 'package:aquarius/screens/auth/login_screen.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/change_pass_dialog.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTab extends StatelessWidget {
  late dynamic userData;

  SettingsTab({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    String formattedNumber = userData['phone'].substring(0, 8) + "*******";

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (() {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text(
                          'Logout Confirmation',
                          style: TextStyle(
                              fontFamily: 'QBold', fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Are you sure you want to Logout?',
                          style: TextStyle(fontFamily: 'QRegular'),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontFamily: 'QRegular',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ));
            }),
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: secondary,
        title: TextBold(text: 'PROFILE', fontSize: 18, color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              title:
                  TextRegular(text: 'First Name', fontSize: 16, color: primary),
              trailing: TextBold(
                  text: userData['firstName'],
                  fontSize: 18,
                  color: Colors.grey),
            ),
            ListTile(
              title:
                  TextRegular(text: 'Last Name', fontSize: 16, color: primary),
              trailing: TextBold(
                  text: userData['lastName'], fontSize: 18, color: Colors.grey),
            ),
            ListTile(
              title: TextRegular(
                  text: 'Phone Number', fontSize: 16, color: primary),
              trailing: TextBold(
                  text: formattedNumber, fontSize: 18, color: Colors.grey),
            ),
            ListTile(
              title:
                  TextRegular(text: 'Password', fontSize: 16, color: primary),
              trailing: SizedBox(
                width: 140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextBold(
                        text: '********', fontSize: 18, color: Colors.grey),
                    TextButton(
                      onPressed: (() {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const ChangePasswordDialog();
                            });
                      }),
                      child:
                          TextBold(text: 'Edit', fontSize: 14, color: primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextBold(
                    text: 'Fishpond Details', fontSize: 16, color: Colors.grey),
              ),
            ),
            ListTile(
              title:
                  TextRegular(text: 'Size (Ha)', fontSize: 16, color: primary),
              trailing: TextBold(
                  text: userData['sizeOfPond'],
                  fontSize: 18,
                  color: Colors.grey),
            ),
            ListTile(
              title: TextRegular(
                  text: 'Domestication', fontSize: 16, color: primary),
              trailing: TextBold(
                  text: userData['doms'], fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            TextRegular(
                text: 'For Changes, contact admin support',
                fontSize: 12,
                color: Colors.grey),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: ButtonWidget(
                  label: 'CONTACT ADMIN',
                  onPressed: (() async {
                    const text = 'mailto:beverlyann.gonzales13@gmail.com';
                    if (await canLaunch(text)) {
                      await launch(text);
                    }
                  }),
                  buttonColor: primary),
            ),
            const Expanded(child: SizedBox()),
            TextBold(text: 'AQUARIUS v1.0', fontSize: 12, color: Colors.grey),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
