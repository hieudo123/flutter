import 'package:build_environment/common/app_colors.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData mIcon;
  final Color mColor;
  final double mSize;

  const RoundIconButton(
      {Key key, @required this.onPressed, this.mIcon, this.mColor, this.mSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: mColor ?? AppColors.kBottomNavColor,
      elevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: mSize ?? 56.0, height: mSize ?? 56.0),
      child: Icon(mIcon),
    );
  }
}
