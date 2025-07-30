import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
  if (_bmi >= 25) {
    return 'Your BMI is high. Try to exercise more and maintain a balanced diet.';
  } else if (_bmi > 18.5) {
    return 'Great! You have a normal body weight. Keep it up!';
  } else {
    return 'You are underweight. You should eat more and consult a nutritionist if needed.';
  }
}

}
