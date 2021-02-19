import 'package:constraints_tutorial/widgets/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color black = Color(0xff333333);
  static const Color grey = Color(0xff828282);
  static const Color pink = Color(0xffF8D9E0);

  ThemeData getDefaultAppTheme() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      textTheme: baseTheme.textTheme.copyWith(
        bodyText1: GoogleFonts.lato().copyWith(color: black),
      ),
    );
  }
}
