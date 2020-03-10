import 'package:bmi_calculator/commons/app_colors.dart';
import 'package:bmi_calculator/commons/app_constants.dart';
import 'package:bmi_calculator/commons/app_strings.dart';
import 'package:bmi_calculator/widgets/my_bottom_button_widget.dart';
import 'package:bmi_calculator/widgets/my_card_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({@required this.resultBMI,@required this.resultText,@required this.interpretation});

  final String resultBMI;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.kAppName.toUpperCase(),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  AppStrings.kYourResult,
                  style: AppConstants.kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: MyCardWidget(
                mColor: AppColors.kActiveColor,
                myCardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$resultText',
                      style: AppConstants.kResultTextStyle,
                    ),
                    Text(
                      '$resultBMI',
                      style: AppConstants.kBMIResultStyle,
                    ),
                    Text(
                      '$interpretation',
                      style: AppConstants.kLabelStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            MyBottomButtonWidget(
              mColor: AppColors.kThumbColor,
              mTitle: AppStrings.kReCalculate.toUpperCase(),
              mHeight: AppConstants.kBottomButtonHeight,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}


