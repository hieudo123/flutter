import 'package:bmi_calculator/commons/app_constants.dart';
import 'package:flutter/material.dart';

class MyBottomButtonWidget extends StatelessWidget {
  final double mHeight;
  final Color mColor;
  final String mTitle;
  final Function onTap;

  const MyBottomButtonWidget({
    Key key, this.mHeight, this.mColor, this.mTitle, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppConstants.kBottomButtonHeight,
        color: mColor,
        child: Center(
            child: Text(
              mTitle,
              style: AppConstants.kLargeTextStyle,
            )),
      ),
    );
  }
}