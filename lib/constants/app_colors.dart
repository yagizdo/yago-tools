import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const black = Color(0xFF101823);
const black_second = Colors.black;
const white = Color(0xFFFFFFFF);
const grey = Color(0xFF787878);


class AppTheme {
  final appTheme = ThemeData(
    // Scaffold
    scaffoldBackgroundColor: black,
    // Appbar
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent,elevation: 0),
    // Text
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: white,
  ),
    ),
  );
}