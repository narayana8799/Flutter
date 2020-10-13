import 'dart:math';

import 'package:flutter/foundation.dart';

class BMI {
  String _bmi;
  double bmi;
  double height;
  double weight;
  BMI({this.height, this.weight});

  String calculate_bmi() {
    bmi = (weight / pow(height / 100, 2)).toDouble();
    _bmi = bmi.toStringAsFixed(2);
    return _bmi;
  }

  String Category() {
    if (bmi > 40.00) {
      return 'extremely obese';
    } else if (bmi > 30.00) {
      return 'obese';
    } else if (bmi > 25.00) {
      return 'overweight';
    } else if (bmi > 18.00) {
      return 'healthy';
    }
    return 'underweight';
  }

  String suggestion() {
    if (bmi > 40.00) {
      return 'You should get to gym and exercise daily';
    } else if (bmi > 30.00) {
      return 'You should exercise daily';
    } else if (bmi > 25.00) {
      return 'Try to joq daily';
    } else if (bmi > 18.00) {
      return 'You are in a good shape';
    }
    return 'You should eat more';
  }
}
