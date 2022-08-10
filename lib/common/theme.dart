import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/common/constants.dart';

class Theme extends GetxService {
   
   getLightTheme() {
    return ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        textTheme: GoogleFonts.getTextTheme(
          'Poppins',
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Constants.black,
                height: 1.2),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Constants.black,
                height: 1.2),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Constants.black,
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Constants.black,
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Constants.black,
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Constants.black,
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Constants.black,
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Constants.black,
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: Constants.black,
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Constants.black,
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: Constants.black,
                height: 1.2),
          ),
        ));
  }
}