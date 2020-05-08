import 'package:flutter/material.dart';
import 'pages/input_page.dart';
import 'pages/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        sliderTheme: SliderThemeData(
          inactiveTrackColor: Color(0xFF8D8E98),
          activeTrackColor: Colors.white,
          thumbColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      home: InputPage(),
    );
  }
}
