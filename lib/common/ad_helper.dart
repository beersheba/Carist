import 'dart:io';

class AdHelper {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-6421731539758811/7634843324";
    } else if (Platform.isIOS) {
      return "ca-app-pub-6421731539758811/2396148456";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
