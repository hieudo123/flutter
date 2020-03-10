import 'package:flutter/material.dart';

class MyRoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData mIcon;
  final Color buttonColor;

  const MyRoundIconButton(
      {Key key, this.onPressed, this.mIcon, this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: buttonColor,
      onPressed: onPressed,
      elevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        mIcon,
        color: Colors.white,
      ),
    );
  }
}
