import 'package:carist/common/locales.dart';
import 'package:carist/common/strings.dart';
import 'package:carist/view/number_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }
  await MobileAds.instance.initialize();
  runApp(
    GetMaterialApp(
      title: 'Carist',
      defaultTransition: Transition.rightToLeft,
      translations: Strings(),
      locale: Get.deviceLocale,
      fallbackLocale: localeUs,
      home: NumberView(),
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: Colors.grey.shade700,
          selectionHandleColor: Colors.white,
        ),
        brightness: Brightness.dark,
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: Colors.grey.shade700,
        ),
      ),
    ),
  );
}
