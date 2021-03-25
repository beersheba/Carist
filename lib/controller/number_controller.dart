import 'package:carist/model/api.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/view/details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NumberController extends GetxController {
  TextEditingController textController;

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
    Get.dialog(
      Center(
        child: CircularProgressIndicator(),
      ),
    );
    var carNumber = textController.text.replaceAll('-', '');
    if (carNumber.length < 7) {
      Get.back();
      Get.snackbar('Error', 'Please enter the valid number');
    } else {
      try {
        CarData data = CarData();
        data.base = await fetchBaseData(carNumber);
        if (data.base != null) {
          data.model = await fetchModelData(
              data.base.modelNumber, data.base.modelCode, data.base.year);
          data.extra = await fetchBrandData(data.model.brand);
          Get.back();
          Get.to(() => DetailsView(), arguments: data);
        }
      } catch (e) {
        Get.back();
        Get.snackbar('Error', 'Number not found');
      }
    }
  }
}
