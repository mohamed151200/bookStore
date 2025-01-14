import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    //scaffoldBackgroundColor: Colors.grey,
    textTheme: TextTheme(
      bodyText1:
          TextStyle(color: Colors.black, fontSize: 18), // لون النص العادي
      bodyText2: GoogleFonts.caveat(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.bold,
),
    ),
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(
      backgroundColor:Color(0xff77094E),
    ),
    dividerColor: Colors.black12,
  );

  static final darkTheme = ThemeData.dark().copyWith(
      primaryColor: mainColor,
      scaffoldBackgroundColor: Colors.white10,
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff77094E),
      ),
      textTheme:  TextTheme(
        bodyText1:
            TextStyle(color: Colors.white, fontSize: 18), // لون النص العادي
        bodyText2:  GoogleFonts.caveat(
  fontSize: 30,
  color: Colors.white,
  fontWeight: FontWeight.bold,
),
      ),
      dividerColor: Colors.white54);
}
