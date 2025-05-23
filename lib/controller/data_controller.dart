import 'package:carist/model/data.dart';
import 'package:carist/model/repository.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Base? base;
  Details? details;
  Importer? importer;
  Extra? extra;

  Future fetchData(String carNumber) async {
    base = await fetchBaseData(carNumber);
    details = await fetchDetailsData(
      base!.modelName,
      base!.modelCode,
      base!.year,
    );
    importer = await fetchImporterData(
      base!.modelName,
      base!.modelCode,
      base!.year,
    );
    extra = await fetchBrandData(details!.brand);
  }
}
