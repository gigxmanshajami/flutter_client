


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monad/splashScreen/splash_screen.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      applyElevationOverlayColor: true,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(color: Color(0xFF888888))
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    home: splashScreen(),
    // home: HomePage(),
  )
);