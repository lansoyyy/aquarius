import 'package:aquarius/screens/tabs/home/oxygen_tab.dart';
import 'package:aquarius/screens/tabs/home/ph_tab.dart';
import 'package:aquarius/utils/colors.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'home/temp_tab.dart';

class HomeTab extends StatefulWidget {
  late dynamic userData;
  HomeTab({super.key, required this.userData});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late String date = '';
  late dynamic data1;

  var hasLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    FirebaseDatabase.instance
        .ref('users/${widget.userData['phone']}')
        .onValue
        .listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;

      var firstKey = data.keys.elementAt(0);
      var firstValue = data.values.elementAt(0);

      setState(() {
        date = firstKey;
        data1 = firstValue;

        hasLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasLoaded
        ? RefreshIndicator(
            onRefresh: () {
              setState(() {
                hasLoaded = false;
              });
              return getData();
            },
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        TextBold(
                            text: 'WELCOME', fontSize: 48, color: Colors.white),
                        TextRegular(
                            text: widget.userData['firstName'] +
                                    ' ' +
                                    widget.userData['lastName'] +
                                    '!' ??
                                '',
                            fontSize: 22,
                            color: Colors.white),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: GestureDetector(
                            onTap: () async {
                              // await FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TempTab(
                                        date: date,
                                        data: data1,
                                        doms: widget.userData['doms'],
                                      )));
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
                                      Image.asset('assets/images/temp.png',
                                          height: 100),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PhTab(
                                        date: date,
                                        data: data1,
                                        doms: widget.userData['doms'],
                                      )));
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
                                  builder: (context) => OxygenTab(
                                        date: date,
                                        data: data1,
                                        doms: widget.userData['doms'],
                                      )));
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
                                      Image.asset(
                                          'assets/images/dissolved-oxygen.png',
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
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
