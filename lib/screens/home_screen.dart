import 'package:aquarius/screens/tabs/data_tab.dart';
import 'package:aquarius/screens/tabs/home_tab.dart';
import 'package:aquarius/screens/tabs/settings_tab.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  late dynamic userData1 = {};

  final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
      .collection('User')
      .doc('xlNx1QAao9bVdJXFjjQmCjbu6Wd2')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      StreamBuilder<DocumentSnapshot>(
          stream: userData,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            dynamic data = snapshot.data;
            return HomeTab(
              userData: data,
            );
          }),
      StreamBuilder<DocumentSnapshot>(
          stream: userData,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            dynamic data = snapshot.data;
            return DataTab(
              userData: data,
            );
          }),
      StreamBuilder<DocumentSnapshot>(
          stream: userData,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text('Loading'));
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            dynamic data = snapshot.data;
            return SettingsTab(
              userData: data,
            );
          })
    ];

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
            unselectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  label: 'Home', icon: Image.asset('assets/images/home.png')),
              BottomNavigationBarItem(
                  label: 'Data', icon: Image.asset('assets/images/data.png')),
              BottomNavigationBarItem(
                  label: 'Profile',
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
        ));
  }
}
