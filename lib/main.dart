import 'package:carist/screens/car_details_screen.dart';
import 'package:carist/screens/car_number_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carist',
      routes: {
        CarNumberScreen.routeName: (context) => CarNumberScreen(),
        CarDetailsScreen.routeName: (context) => CarDetailsScreen(),
      },
      initialRoute: CarNumberScreen.routeName,
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
    );
  }
}
