import 'package:bmi_calculator/commons/app_colors.dart';
import 'package:bmi_calculator/commons/app_constants.dart';
import 'package:bmi_calculator/commons/app_strings.dart';
import 'package:bmi_calculator/models/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widgets/my_bottom_button_widget.dart';
import 'package:bmi_calculator/widgets/my_card_widget.dart';
import 'package:bmi_calculator/widgets/my_icon_content.dart';
import 'package:bmi_calculator/widgets/my_round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender = Gender.male;
  int heightValue = 180;
  int weightValue = 45;
  int ageValue = 20;
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
            children: <Widget>[
              _buildPickingGenderWidget(),
              _buildPickingHeightWidget(context),
              Expanded(
                child: Row(
                  children: <Widget>[
                    _buildPickingWeightWidget(),
                    _buildPickingAgeWidget()
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MyBottomButtonWidget(
                mColor: AppColors.kThumbColor,
                mTitle: AppStrings.kCalculate.toUpperCase(),
                mHeight: AppConstants.kBottomButtonHeight,
                onTap: () {
                  CalculatorBrain calculatorBrain =
                      new CalculatorBrain(heightValue, weightValue);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                resultBMI: calculatorBrain.calculatorBMI(),
                                resultText: calculatorBrain.getResult(),
                                interpretation:
                                    calculatorBrain.getInterpretation(),
                              )));
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildPickingAgeWidget() {
    return Expanded(
      child: MyCardWidget(
        mColor: AppColors.kInActiveColor,
        myCardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppStrings.kAge,
              style: AppConstants.kLabelStyle,
            ),
            Text(
              '$ageValue',
              style: AppConstants.kNumberStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyRoundIconButton(
                  buttonColor: AppColors.kActiveColor,
                  mIcon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (ageValue > 0) ageValue--;
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                MyRoundIconButton(
                  buttonColor: AppColors.kActiveColor,
                  mIcon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      ageValue++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPickingWeightWidget() {
    return Expanded(
      child: MyCardWidget(
        mColor: AppColors.kInActiveColor,
        myCardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppStrings.kWeight,
              style: AppConstants.kLabelStyle,
            ),
            Text(
              '$weightValue',
              style: AppConstants.kNumberStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MyRoundIconButton(
                  buttonColor: AppColors.kActiveColor,
                  mIcon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      if (weightValue > 0) weightValue--;
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                MyRoundIconButton(
                  buttonColor: AppColors.kActiveColor,
                  mIcon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      weightValue++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPickingHeightWidget(BuildContext context) {
    return Expanded(
      child: MyCardWidget(
        mColor: AppColors.kInActiveColor,
        myCardChild: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppStrings.kHeight,
                style: AppConstants.kLabelStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    '$heightValue',
                    style: AppConstants.kNumberStyle,
                  ),
                  Text(
                    'cm',
                    style: AppConstants.kLabelStyle,
                  )
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: AppColors.kThumbColor,
                  activeTrackColor: AppColors.kWhiteColor,
                  inactiveTrackColor: AppColors.kSliderInActiveColor,
                  overlayColor: Color(0x52EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: heightValue.toDouble(),
                  min: 120.0,
                  max: 320.0,
                  onChanged: (value) {
                    setState(() {
                      heightValue = value.toInt();
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPickingGenderWidget() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: MyCardWidget(
              mColor: selectedGender == Gender.male
                  ? AppColors.kActiveColor
                  : AppColors.kInActiveColor,
              myCardChild: MyIconContentWidget(
                mIcon: FontAwesomeIcons.mars,
                title: AppStrings.kMales,
              ),
              onTap: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
            ),
          ),
          Expanded(
            child: MyCardWidget(
              mColor: selectedGender == Gender.female
                  ? AppColors.kActiveColor
                  : AppColors.kInActiveColor,
              myCardChild: MyIconContentWidget(
                mIcon: FontAwesomeIcons.venus,
                title: AppStrings.kFemales,
              ),
              onTap: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
