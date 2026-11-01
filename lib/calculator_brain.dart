import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight});

  late double bmi;


// bmiCalculator
  String bmiCalculator () {
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

//   getResultText
  String getResultText () {
    if (bmi <= 18.5) {
      return 'Underweight';
    }
    else if (bmi < 24.9) {
      return 'Normal';
    }
    else {
      return 'Overweight';
    }
  }

// getInterpretation
  String getInterpretation () {
    if (bmi <= 18.5) {
      return 'Your BMI result is quite low! You should eat more';
    }
    else if (bmi < 24.9) {
      return 'Your BMI is normal. You are good';
    }
    else {
      return 'Your BMI is above the normal. Watch your weight you glutton';
    }
  }
}