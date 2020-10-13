import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Dicee Dash')),
          backgroundColor: Colors.red,
        ),
        body: Container(
          child: Center(
            child: Dice(),
          ),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DiceState();
  }
}

class DiceState extends State<Dice> {
  void updateDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
      print(leftDiceNumber);
    });
  }

  @override
  int leftDiceNumber = 1;
  int rightDiceNumber = 4;
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: FlatButton(
            child: Image.asset('./images/dice$leftDiceNumber.png'),
            onPressed: updateDice,
          ),
        ),
        Expanded(
          flex: 2,
          child: FlatButton(
            child: Image.asset('./images/dice$rightDiceNumber.png'),
            onPressed: updateDice,
          ),
        ),
      ],
    );
  }
}
