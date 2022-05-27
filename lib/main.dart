

import 'package:flutter/material.dart';
import 'package:freelance/splashScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme:   InputDecorationTheme(
          hintStyle: GoogleFonts.lato(
            color: Colors.grey, // <-- Change this
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
          labelStyle: const TextStyle(
            color: Colors.teal,
          ),

          enabledBorder: InputBorder.none,
          disabledBorder:InputBorder.none,
          focusedBorder: InputBorder.none,

        )
      ),
      debugShowCheckedModeBanner: false,
      home:  const SlpashScreen(),

    );
  }
}

