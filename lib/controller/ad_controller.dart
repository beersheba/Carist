import 'package:carist/common/ad_helper.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdController extends GetxController {
  InterstitialAd _interstitialAd;
  bool _isInterstitialAdReady = false;

  @override
  void onInit() {
    _loadInterstitialAd();
    super.onInit();
  }

  @override
  void onClose() {
    _interstitialAd?.dispose();
    super.onClose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          this._interstitialAd = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              _interstitialAd.dispose();
              _isInterstitialAdReady = false;
              _loadInterstitialAd();
            },
          );

          _isInterstitialAdReady = true;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
          _isInterstitialAdReady = false;
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (_isInterstitialAdReady) {
      _interstitialAd.show();
    }
  }
}
