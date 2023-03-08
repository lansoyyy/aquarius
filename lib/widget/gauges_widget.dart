import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeChart extends StatelessWidget {
  late dynamic data;
  final String opium;

  GaugeChart({super.key, this.data, required this.opium});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            showTicks: false,
            startAngle: 180,
            endAngle: 0,
            radiusFactor: 0.8,
            canScaleToFit: true,
            axisLineStyle: const AxisLineStyle(
              thickness: 0.1,
              color: Color.fromARGB(30, 0, 169, 181),
              thicknessUnit: GaugeSizeUnit.factor,
              cornerStyle: CornerStyle.startCurve,
            ),
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,
                widget: Text(
                  data.toString(),
                  style: const TextStyle(
                      fontFamily: 'QBold',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 1.50,
                widget: Column(
                  children: [
                    const Text(
                      'Optimum at',
                      style: TextStyle(
                          fontFamily: 'QBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      opium,
                      style: const TextStyle(
                          fontFamily: 'QBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
            ranges: [
              GaugeRange(
                  startValue: 0, endValue: 1.0, color: const Color(0xffB9F3E4)),
              GaugeRange(
                  startValue: 1.0,
                  endValue: 2.5,
                  color: const Color(0xffB9F3E4)),
              GaugeRange(
                  startValue: 2.5,
                  endValue: 4.8,
                  color: const Color(0xffB9F3E4)),
            ],
            pointers: const <GaugePointer>[
              RangePointer(
                  color: Color.fromARGB(255, 192, 236, 225),
                  value: 100,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  cornerStyle: CornerStyle.bothCurve),
            ],
          )
        ],
      ),
    );
  }
}
