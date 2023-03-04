import 'package:aquarius/widget/text_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DataTab extends StatefulWidget {
  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {
  var dropItems = [
    ' Today',
    'Yesterday',
    '2 Days Ago',
    'Last Week ',
    'Last Month'
  ];

  var dropValue = 0;

  DatabaseReference starCountRef =
      FirebaseDatabase.instance.ref('users/+639639530422');

  @override
  Widget build(BuildContext context) {
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      print(data);
    });
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
                              value: i,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(50, 2, 50, 2),
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
                          LineSeries<ChartData, String>(
                              dataSource: [
                                // Bind data source
                                ChartData('15:29', 1),
                                ChartData('15:30', 7.5),
                                ChartData('15:31', 2.8),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
                ),
              ),
              TextRegular(
                  text: 'Temperature', fontSize: 18, color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                          LineSeries<ChartData, String>(
                              dataSource: [
                                // Bind data source
                                ChartData('15:29', 1),
                                ChartData('15:30', 7.5),
                                ChartData('15:31', 2.8),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
                ),
              ),
              TextRegular(
                  text: 'Dissolved Oxygen', fontSize: 18, color: Colors.white),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                          LineSeries<ChartData, String>(
                              dataSource: [
                                // Bind data source
                                ChartData('15:29', 1),
                                ChartData('15:30', 7.5),
                                ChartData('15:31', 2.8),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
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

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
