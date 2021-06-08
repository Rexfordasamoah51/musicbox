import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicbox/logic/services/theme/app_color.dart';
import 'package:sizer/sizer.dart';


///[MusicBoxAppTheme]  this is were all the app logic hungs
class MusicBoxAppTheme {
  static late TextTheme lightTextTheme = TextTheme(
      bodyText1: GoogleFonts.lato(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: MusicBoxAppColor.shark),
      headline2: GoogleFonts.lato(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: MusicBoxAppColor.woodSmoke),
      headline1: GoogleFonts.lato(
          fontSize: 50.sp,
          fontWeight: FontWeight.bold,
          color: MusicBoxAppColor.woodSmoke));

  static late TextTheme darkTextTheme = TextTheme(
      bodyText1: GoogleFonts.lato(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
          color: MusicBoxAppColor.manatee),
      headline2: GoogleFonts.lato(
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
          color: MusicBoxAppColor.white),
      headline1: GoogleFonts.lato(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: MusicBoxAppColor.white));

  static ThemeData light() => ThemeData(
      brightness: Brightness.light,
      primaryColor: MusicBoxAppColor.white,
      accentColor: MusicBoxAppColor.woodSmoke,
      textTheme: lightTextTheme,
      textSelectionTheme: const TextSelectionThemeData(
          selectionColor: MusicBoxAppColor.pictonBlue));

  static  ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: MusicBoxAppColor.manatee,
    accentColor: MusicBoxAppColor.woodSmoke,
    textTheme: darkTextTheme,
  );
}
