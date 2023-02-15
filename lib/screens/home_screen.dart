import 'package:aquarius/screens/tabs/data_tab.dart';
import 'package:aquarius/screens/tabs/home_tab.dart';
import 'package:aquarius/screens/tabs/settings_tab.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final tabs = [const HomeTab(), const DataTab(), const SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 0,
        color: Colors.transparent,
        child: BottomNavigationBar(
          currentIndex: _index,
          backgroundColor: secondary,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'QBold',
              color: Colors.white),
          unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'QRegular',
              color: Colors.grey),
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Image.asset('assets/images/home.png')),
            BottomNavigationBarItem(
                label: 'Data', icon: Image.asset('assets/images/data.png')),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Image.asset('assets/images/profile.png')),
          ],
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(child: tabs[_index]),
      ),
    );
  }
}
