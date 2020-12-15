import 'package:carist/screens/car_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carist',
      theme: ThemeData(
        brightness: Brightness.dark,
        textSelectionHandleColor: Colors.white,
        textSelectionColor: Colors.grey.shade700,
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData(
            brightness: Brightness.dark,
          ).textTheme,
        ),
      ),
      home: EnterPlateScreen(),
    );
  }
}
