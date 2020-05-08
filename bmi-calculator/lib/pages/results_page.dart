import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/my_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: resultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              color: activeColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: bmiTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: bmiStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: bmiIntStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: bottomStyle,
                ),
              ),
              color: bottomColor,
              height: 80.0,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
