import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/labelled_icon.dart';
import '../widgets/myicon_button.dart';
import '../widgets/my_card.dart';
import '../constants.dart';
import '../calculator.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 160;
  int weight = 70;
  int age = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      color: selectedGender == Gender.MALE
                          ? activeColor
                          : inactiveColor,
                      child: LabelledIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.MALE;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      color: selectedGender == Gender.FEMALE
                          ? activeColor
                          : inactiveColor,
                      child: LabelledIcon(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.FEMALE;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyCard(
                color: activeColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberLabel,
                        ),
                        Text(
                          'cm',
                          style: labelStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double temp) {
                        setState(() {
                          height = temp.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      color: activeColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: numberLabel,
                              ),
                              Text(
                                'kg',
                                style: labelStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MyIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      color: activeColor,
                      child: MyCard(
                        color: activeColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: labelStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  age.toString(),
                                  style: numberLabel,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                MyIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MyIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculator calc = Calculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.getResult(),
                      resultText: calc.getResultText(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: bottomStyle,
                  ),
                ),
                color: bottomColor,
                height: 80.0,
                margin: EdgeInsets.only(top: 10.0),
              ),
            ),
          ],
        ));
  }
}
