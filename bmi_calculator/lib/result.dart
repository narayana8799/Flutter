import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuseablecard.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String suggestion;
  final String category;
  final String bmi;

  Result(
      {@required this.bmi, @required this.category, @required this.suggestion});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ReusableCard(
              onTap: null,
              colour: activeColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    category.toUpperCase(),
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi.toUpperCase(),
                    style: tbStyle,
                  ),
                  Text(
                    suggestion.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: ReusableCard(
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                colour: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
