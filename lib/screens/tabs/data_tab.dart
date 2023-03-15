import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class DataTab extends StatefulWidget {
  late dynamic userData;
  DataTab({super.key, required this.userData});
  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  var dropItems = [
    'Today',
    'Yesterday',
    '2 Days Ago',
    'Last Week',
    'Last Month'
  ];

  var filter = 'Today';

  var dropValue = 0;

  var hasLoaded = false;

  late String date = '';
  late dynamic data1;
  late dynamic data2;

  List datas1 = [];
  List datas2 = [];
  List datas3 = [];
  List datas4 = [];
  List datas5 = [];

  List datas11 = [];
  List datas22 = [];
  List datas33 = [];
  List datas44 = [];
  List datas55 = [];

  getData() {
    datas1.clear();
    datas2.clear();
    datas3.clear();
    datas4.clear();
    datas5.clear();

    for (int i = 0; i < data1.length; i++) {
      DateTime today = DateTime.now();
      DateTime yesterday = today.subtract(const Duration(days: 1));
      DateTime twoDaysAgo = today.subtract(const Duration(days: 2));
      DateTime lastWeek = today.subtract(const Duration(days: 7));
      DateTime lastMonth = today.subtract(const Duration(days: 30));
      var date = DateTime.fromMillisecondsSinceEpoch(
          int.parse(data1.elementAt(i)) * 1000);

      var customFormat1 = DateFormat('yy-dd-MM hh:mm').format(date);

      if (date.isAfter(today.subtract(const Duration(days: 1)))) {
        datas1.add(data2.elementAt(i));
        datas11.add(customFormat1);
      } else if (date.isAfter(yesterday)) {
        datas5.add(data2.elementAt(i));
        datas55.add(customFormat1);
      } else if (date.isAfter(twoDaysAgo)) {
        datas2.add(data2.elementAt(i));
        datas22.add(customFormat1);
      } else if (date.isAfter(lastWeek)) {
        datas3.add(data2.elementAt(i));
        datas33.add(customFormat1);
      } else if (date.isAfter(lastMonth)) {
        datas4.add(data2.elementAt(i));
        datas44.add(customFormat1);
      }
    }

    print(datas1.length);
    print(datas2.length);
    print(datas3.length);
    print(datas4.length);
    print(datas5.length);
  }

  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance
        .ref('users/${widget.userData['phone']}')
        .orderByKey()
        .onValue
        .listen((DatabaseEvent event) {
      final dynamic data = event.snapshot.value;

      setState(() {
        data1 = data.keys;
        data2 = data.values;

        hasLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return SingleChildScrollView(
        child: Container(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextRegular(text: 'Show', fontSize: 16, color: Colors.white),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: DropdownButton(
                      underline: const SizedBox(),
                      value: dropValue,
                      items: [
                        for (int i = 0; i < dropItems.length; i++)
                          DropdownMenuItem(
                            onTap: () {
                              filter = dropItems[i];
                            },
                            value: i,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(50, 2, 50, 2),
                              child: TextRegular(
                                  text: dropItems[i],
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                      ],
                      onChanged: ((value) {
                        setState(() {
                          dropValue = int.parse(value.toString());
                        });
                      })),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextRegular(text: 'pH Level', fontSize: 18, color: Colors.white),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: InteractiveViewer(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SfCartesianChart(
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          filter == 'Today'
                              ? LineSeries<ChartData, String>(
                                  dataSource: [
                                      // Bind data source
                                      for (int i = 0; i < datas1.length; i++)
                                        ChartData(
                                            i.toString(), datas1[i]['pH']),
                                    ],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                              : filter == 'Yesterday'
                                  ? LineSeries<ChartData, String>(
                                      dataSource: [
                                          // Bind data source
                                          for (int i = 0;
                                              i < datas5.length;
                                              i++)
                                            ChartData(
                                                i.toString(), datas5[i]['pH']),
                                        ],
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y)
                                  : filter == '2 Days Ago'
                                      ? LineSeries<ChartData, String>(
                                          dataSource: [
                                              // Bind data source
                                              for (int i = 0;
                                                  i < datas2.length;
                                                  i++)
                                                ChartData(i.toString(),
                                                    datas2[i]['pH']),
                                            ],
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y)
                                      : filter == 'Last Week'
                                          ? LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas3.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas3[i]['pH']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                                          : LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas4.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas4[i]['pH']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                        ]),
                  ),
                ),
              ),
            ),
            TextRegular(text: 'Temperature', fontSize: 18, color: Colors.white),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: InteractiveViewer(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SfCartesianChart(
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          filter == 'Today'
                              ? LineSeries<ChartData, String>(
                                  dataSource: [
                                      // Bind data source
                                      for (int i = 0; i < datas1.length; i++)
                                        ChartData(
                                            i.toString(), datas1[i]['temp']),
                                    ],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                              : filter == 'Yesterday'
                                  ? LineSeries<ChartData, String>(
                                      dataSource: [
                                          // Bind data source
                                          for (int i = 0;
                                              i < datas5.length;
                                              i++)
                                            ChartData(i.toString(),
                                                datas5[i]['temp']),
                                        ],
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y)
                                  : filter == '2 Days Ago'
                                      ? LineSeries<ChartData, String>(
                                          dataSource: [
                                              // Bind data source
                                              for (int i = 0;
                                                  i < datas2.length;
                                                  i++)
                                                ChartData(i.toString(),
                                                    datas2[i]['temp']),
                                            ],
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y)
                                      : filter == 'Last Week'
                                          ? LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas3.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas3[i]['temp']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                                          : LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas4.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas4[i]['temp']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                        ]),
                  ),
                ),
              ),
            ),
            TextRegular(
                text: 'Dissolved Oxygen', fontSize: 18, color: Colors.white),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: InteractiveViewer(
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: SfCartesianChart(
                        // Initialize category axis
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          filter == 'Today'
                              ? LineSeries<ChartData, String>(
                                  dataSource: [
                                      // Bind data source
                                      for (int i = 0; i < datas1.length; i++)
                                        ChartData(
                                            i.toString(), datas1[i]['DO']),
                                    ],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y)
                              : filter == 'Yesterday'
                                  ? LineSeries<ChartData, String>(
                                      dataSource: [
                                          // Bind data source
                                          for (int i = 0;
                                              i < datas5.length;
                                              i++)
                                            ChartData(
                                                i.toString(), datas5[i]['DO']),
                                        ],
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y)
                                  : filter == '2 Days Ago'
                                      ? LineSeries<ChartData, String>(
                                          dataSource: [
                                              // Bind data source
                                              for (int i = 0;
                                                  i < datas2.length;
                                                  i++)
                                                ChartData(i.toString(),
                                                    datas2[i]['DO']),
                                            ],
                                          xValueMapper: (ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (ChartData data, _) =>
                                              data.y)
                                      : filter == 'Last Week'
                                          ? LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas3.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas3[i]['DO']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                                          : LineSeries<ChartData, String>(
                                              dataSource: [
                                                  // Bind data source
                                                  for (int i = 0;
                                                      i < datas4.length;
                                                      i++)
                                                    ChartData(i.toString(),
                                                        datas4[i]['DO']),
                                                ],
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y)
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final dynamic? y;
}
