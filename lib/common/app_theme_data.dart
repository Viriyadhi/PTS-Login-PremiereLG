import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_values.dart';

class AppThemeData {
  static ThemeData getTheme() {
    const Color primaryColor = ColorValues.primaryGreen;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor = MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
      canvasColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ColorValues.primaryGreen),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: ColorValues.primaryGreen,
          elevation: 0.0,
          minimumSize: const Size(double.infinity, 45.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          textStyle: GoogleFonts.lato(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.lato(fontSize: 24.0, fontWeight: FontWeight.w900, color: Colors.black),
        subtitle1: GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.w500, color: ColorValues.mediumGrey),
        bodyText1: GoogleFonts.lato(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
      ));
  }
}
