import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeChart extends StatelessWidget {
  const GaugeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 180,
            endAngle: 1.8,
            radiusFactor: 0.9,
            minimum: 0,
            maximum: 4.8,
            ranges: <GaugeRange>[
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
            pointers: const <GaugePointer>[NeedlePointer(value: 2.72)],
            annotations: <GaugeAnnotation>[
              const GaugeAnnotation(
                angle: 90,
                positionFactor: 0.5,
                widget: Text(
                  '27.18',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              GaugeAnnotation(
                angle: 90,
                positionFactor: 1.75,
                widget: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Optimum at',
                      style: TextStyle(
                          fontFamily: 'QBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '26.0 - 32.0 C',
                      style: TextStyle(
                          fontFamily: 'QBold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
