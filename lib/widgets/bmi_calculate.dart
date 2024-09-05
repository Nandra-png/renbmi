class BMICalculator {
  final double height;
  final double weight;

  BMICalculator({required this.height, required this.weight});

  double calculateBMI() {
    return weight / (height * height);
  }

  String getBMICategory() {
    double bmi = calculateBMI();

    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}