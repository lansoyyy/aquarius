import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          elevation: 3,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
                label: 'Home', icon: Image.asset('assets/images/home.png')),
            BottomNavigationBarItem(
                label: 'Data', icon: Image.asset('assets/images/data.png')),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Image.asset('assets/images/profile.png'))
          ]),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
