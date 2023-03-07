import 'package:aquarius/widget/gauges_widget.dart';
import 'package:aquarius/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TempTab extends StatefulWidget {
  final String doms;
  final dynamic data;
  final String date;

  const TempTab({required this.doms, required this.data, required this.date});

  @override
  State<TempTab> createState() => _TempTabState();
}

class _TempTabState extends State<TempTab> {
  @override
  Widget build(BuildContext context) {
    print(widget.date);
    var date =
        DateTime.fromMillisecondsSinceEpoch(int.parse(widget.date) * 1000);

    var isoFormat = date.toIso8601String(); // '2023-03-07T08:43:34.000Z'

    var customFormat = DateFormat('dd-MM-yyyy').format(date);

    var customFormat1 = DateFormat('hh:mm a').format(date);
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
              TextBold(text: 'Temperature', fontSize: 28, color: Colors.white),
              const SizedBox(
                height: 20,
              ),
              GaugeChart(
                data: widget.data['temp'],
              ),
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
                        text: customFormat, fontSize: 18, color: Colors.grey),
                    trailing: TextBold(
                        text: customFormat1, fontSize: 16, color: Colors.grey),
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
                        text: widget.doms, fontSize: 16, color: Colors.grey),
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
                    trailing: TextBold(
                        text: widget.data['Aerator Status'] == 0 ? 'Off' : 'On',
                        fontSize: 16,
                        color: Colors.grey),
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
