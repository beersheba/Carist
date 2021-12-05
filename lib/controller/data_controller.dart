import 'package:carist/model/data.dart';
import 'package:carist/model/repository.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var base = Base();
  var details = Details();
  var importer = Importer();
  var extra = Extra();

  Future fetchData(String carNumber) async {
    base = await fetchBaseData(carNumber);
    if (base != null) {
      details =
          await fetchDetailsData(base.modelName, base.modelCode, base.year);
      importer =
          await fetchImporterData(base.modelName, base.modelCode, base.year);
      if (details != null) {
        extra = await fetchBrandData(details.brand);
      }
    }
  }
}
