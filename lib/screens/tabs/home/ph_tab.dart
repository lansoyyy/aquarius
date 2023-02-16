import 'package:aquarius/widget/gauges_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';

class PhTab extends StatelessWidget {
  const PhTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              TextBold(text: 'pH Level', fontSize: 28, color: Colors.white),
              const SizedBox(
                height: 20,
              ),
              const GaugeChart(),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: TextBold(
                        text: 'DD/MM/YY', fontSize: 18, color: Colors.grey),
                    trailing: TextBold(
                        text: 'HH:MM AM', fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: TextBold(
                        text: 'Domestication:',
                        fontSize: 18,
                        color: Colors.grey),
                    trailing: TextBold(
                        text: 'Bangus', fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: TextBold(
                        text: 'Aerator:', fontSize: 18, color: Colors.grey),
                    trailing:
                        TextBold(text: 'Off', fontSize: 16, color: Colors.grey),
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
