import 'package:carist/common/locales.dart';
import 'package:carist/controller/ad_controller.dart';
import 'package:carist/controller/data_controller.dart';
import 'package:carist/view/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberController extends GetxController {
  late DataController _dataController;
  late AdController _adController;

  late TextEditingController _textController;

  TextEditingController get textController => _textController;

  @override
  void onInit() {
    _textController = TextEditingController();
    _dataController = Get.put(DataController());
    _adController = Get.put(AdController());
    super.onInit();
  }

  @override
  void onClose() {
    _textController.dispose();
    super.onClose();
  }

  void submitNumber() async {
    Get.dialog(Center(child: CircularProgressIndicator(color: Colors.white)),
        barrierDismissible: false);
    var carNumber = _textController.text.replaceAll('-', '');
    if (carNumber.length < 7) {
      Get.back();
      Get.snackbar('error'.tr, 'error_number_invalid'.tr);
    } else {
      try {
        await _dataController.fetchData(carNumber);
        if (_adController.shouldShowAd()) {
          _adController.showInterstitialAd();
        }
        _adController.updateCounter();
        _moveToDetails();
            } catch (e) {
        print(e);
        _showError();
      }
    }
  }

  void _showError() {
    Get.back();
    Get.snackbar('error'.tr, 'error_number_not_found'.tr);
  }

  void _moveToDetails() {
    Get.back();
    Get.to(() => DetailsView());
  }

  void setLocale(value) {
    var locale = localeUs;
    if (value == Language.hebrew) {
      locale = localeIl;
    }
    Get.updateLocale(locale);
  }
}
