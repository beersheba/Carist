import 'package:carist/model/data.dart';
import 'package:carist/model/repository.dart';
import 'package:carist/view/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NumberController extends GetxController {
  TextEditingController textController;
  var base = Base().obs;
  var model = Model().obs;
  var extra = Extra().obs;

  @override
  void onInit() {
    textController = TextEditingController();
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
        base.value = await fetchBaseData(carNumber);
        if (base.value != null) {
          model.value = await fetchModelData(
              base.value.modelName, base.value.modelCode, base.value.year);
          extra.value = await fetchBrandData(model.value.brand);
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
