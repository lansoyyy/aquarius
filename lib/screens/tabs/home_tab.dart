import 'package:aquarius/screens/tabs/home/oxygen_tab.dart';
import 'package:aquarius/screens/tabs/home/ph_tab.dart';
import 'package:aquarius/screens/tabs/home/temp_tab.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              TextBold(text: 'WELCOME', fontSize: 48, color: Colors.white),
              TextRegular(text: 'John Doe!', fontSize: 22, color: Colors.white),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TempTab()));
                  },
                  child: Card(
                    elevation: 3,
                    child: Container(
                      width: 180,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/temp.png', height: 100),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                              text: 'Temperature',
                              fontSize: 18,
                              color: secondary,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const PhTab()));
                  },
                  child: Card(
                    elevation: 3,
                    child: Container(
                      width: 180,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/ph-level.png',
                                height: 100),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                              text: 'pH Level',
                              fontSize: 18,
                              color: secondary,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OxygenTab()));
                  },
                  child: Card(
                    elevation: 3,
                    child: Container(
                      width: 180,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/dissolved-oxygen.png',
                                height: 80),
                            const SizedBox(
                              height: 10,
                            ),
                            TextRegular(
                              text: 'Dissolved\nOxygen',
                              fontSize: 18,
                              color: secondary,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
