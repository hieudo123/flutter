import 'package:bmi_calculator/commons/app_colors.dart';
import 'package:bmi_calculator/commons/app_constants.dart';
import 'package:bmi_calculator/screens/input_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.kPrimaryColor,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => InputScreen(),
        AppConstants.kResultScreen: (BuildContext context) => ResultScreen(),
      },
    );
  }
}
