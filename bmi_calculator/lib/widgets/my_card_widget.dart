import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final Color mColor;
  final Widget myCardChild;
  final Function onTap;

  const MyCardWidget({
    Key key,
    this.mColor,
    this.myCardChild, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: myCardChild,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: mColor,
        ),
      ),
    );
  }
}