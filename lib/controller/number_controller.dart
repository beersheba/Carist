import 'package:carist/controller/data_controller.dart';
import 'package:carist/view/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NumberController extends GetxController {
  DataController _dataController;
  TextEditingController _textController;
  TextEditingController get textController => _textController;

  @override
  void onInit() {
    _textController = TextEditingController();
    _dataController = Get.put(DataController());
    super.onInit();
  }

  @override
  void onClose() {
    _textController?.dispose();
    super.onClose();
  }

  void submitNumber() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var carNumber = _textController.text.replaceAll('-', '');
    if (carNumber.length < 7) {
      Get.back();
      Get.snackbar('error'.tr, 'error_number_invalid'.tr);
    } else {
      try {
        await _dataController.fetchData(carNumber);
        if (_dataController.base.value != null) {
          Get.back();
          Get.to(() => DetailsView());
        }
      } catch (e) {
        print(e);
        Get.back();
        Get.snackbar('error'.tr, 'error_number_not_found'.tr);
      }
    }
  }
}
