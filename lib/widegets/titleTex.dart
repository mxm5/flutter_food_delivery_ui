import 'package:flutter/material.dart';

Padding buildPaddedTitleText(
    {String textString = 'سفارشات اخیر ',
    double letterSpacing = 0,
    Color color = Colors.black,
    double fontSize = 20 }) {
  return Padding(
    padding:  EdgeInsets.only(right: 20, top: 8, bottom: 5),
    child: Text(
      textString,
      style: TextStyle(
          fontFamily: 'hekayat',
          color: color,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontWeight: FontWeight.bold),
      textDirection: TextDirection.rtl,
    ),
  );
}
