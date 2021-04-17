import 'package:carist/model/data.dart';
import 'package:carist/model/repository.dart';
import 'package:get/get.dart';

import 'number_controller.dart';

class DetailsController extends GetxController {
  var details = Details().obs;

  final NumberController _numberController = Get.find();

  @override
  void onInit() {
    _fetchDetails();
    super.onInit();
  }

  void _fetchDetails() async {
    Base base = _numberController.base.value;
    details.value =
        await fetchDetailsData(base.modelName, base.modelCode, base.year);
  }
}
