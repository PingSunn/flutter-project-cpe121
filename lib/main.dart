import 'package:flutter/material.dart';
import 'MainScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title",
      home: MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.lato().fontFamily, // Use the fontFamily property of the TextStyle object
      ),
    );
  }
}
