import 'dart:math';

class BmiLogic {
  BmiLogic({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 15) {
      return 'Very severely underweight';
    } else if (15 < _bmi && _bmi < 16) {
      return 'Severely underweight';
    } else if (16 < _bmi && _bmi < 18.5) {
      return 'Underweight';
    } else if (18.5 < _bmi && _bmi < 25) {
      return 'Normal';
    } else if (25 < _bmi && _bmi < 30) {
      return 'Overweight';
    } else if (30 < _bmi && _bmi < 35) {
      return 'Moderately obese';
    } else if (35 < _bmi && _bmi < 40) {
      return 'Severely obese';
    } else {
      return 'Very severely obese';
    }
  }

  String showDescription() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try some exercises.\n';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Keep Going!\n';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.\n';
    }
  }
}
