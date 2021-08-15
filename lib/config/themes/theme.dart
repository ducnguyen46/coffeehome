import 'package:coffeehome/config/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme =
    ThemeData(fontFamily: GoogleFonts.poppins().fontFamily).copyWith(
        brightness: Brightness.light,
        primaryColor: bluewood,
        textTheme: textLightTheme,
        dividerTheme: ThemeData().dividerTheme.copyWith(
              thickness: 2,
              color: Color(0xFFF4F5F7),
            ),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: bluewood,
              onPrimary: lightwhite,
              onSurface: blacknavy,
              surface: whitegray,
              secondary: lightwhite,
              onSecondary: blacknavy,
            ));

ThemeData darkTheme = ThemeData();

var textLightTheme = TextTheme(
  headline5:
      GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w500).apply(
    color: blacknavy,
  ),
  headline6: GoogleFonts.poppins(
          fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.15)
      .apply(
    color: blacknavy,
  ),
  bodyText1:
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500).apply(
    color: blacknavy,
  ),
  bodyText2:
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500).apply(
    color: whitegray,
  ),
  subtitle1:
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500).apply(
    color: blacknavy,
  ),
  subtitle2:
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400).apply(
    color: blacknavy,
  ),
  button: GoogleFonts.poppins(
          fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 1.25)
      .apply(color: lightwhite),
  caption: GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  ).apply(
    color: blacknavy,
  ),
);
