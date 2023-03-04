import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/button_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  late dynamic userData;

  SettingsTab({required this.userData});

  @override
  Widget build(BuildContext context) {
    String formattedNumber = userData['phone'].substring(0, 8) + "*******";

    return Scaffold(
      appBar: AppBar(
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
                      onPressed: (() {}),
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
                  onPressed: (() {}),
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
