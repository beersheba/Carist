import 'package:carist/model/data.dart';
import 'package:carist/model/repository.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var base = Base().obs;
  var details = Details().obs;
  var extra = Extra().obs;

  Future fetchData(String carNumber) async {
    base.value = await fetchBaseData(carNumber);
    details.value = await fetchDetailsData(
        base.value.modelName, base.value.modelCode, base.value.year);
    extra.value = await fetchBrandData(details.value.brand);
  }
}
