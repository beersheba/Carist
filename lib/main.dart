import 'package:carist/common/strings.dart';
import 'package:carist/view/number_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      title: 'Carist',
      defaultTransition: Transition.rightToLeft,
      translations: Strings(),
      locale: Get.deviceLocale,
      // locale: Locale('he', 'IL'),
      fallbackLocale: Locale('en', 'US'),
      home: NumberView(),
      theme: ThemeData(
        accentColor: Colors.grey.shade700,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.shade700,
          selectionHandleColor: Colors.white,
        ),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
      ),
    ),
  );
}
