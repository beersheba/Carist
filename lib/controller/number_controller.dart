import 'package:carist/controller/data_controller.dart';
import 'package:carist/view/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NumberController extends GetxController {
  TextEditingController textController;
  DataController dataController;

  @override
  void onInit() {
    textController = TextEditingController();
    dataController = Get.put(DataController());
    super.onInit();
  }

  @override
  void onClose() {
    textController?.dispose();
    super.onClose();
  }

  void submitNumber() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var carNumber = textController.text.replaceAll('-', '');
    if (carNumber.length < 7) {
      Get.back();
      Get.snackbar('error'.tr, 'error_number_invalid'.tr);
    } else {
      try {
        await dataController.fetchData(carNumber);
        if (dataController.base.value != null) {
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
