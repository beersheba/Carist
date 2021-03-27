import 'package:carist/common/firestore_client.dart';
import 'package:carist/common/http_client.dart';
import 'package:carist/model/data.dart';
import 'package:carist/model/logos.dart';

const String baseUrl = 'https://data.gov.il/api/action/datastore_search';

Future<Base> fetchBaseData(String carNumber) async {
  String resourceId = '053cea08-09bc-40ec-8f7a-156f0677aff3';
  String url = '$baseUrl?resource_id=$resourceId&q=$carNumber';
  var json = await HttpClient(url).getData();
  return Base.fromJson(json);
}

Future<Model> fetchModelData(
    String modelNumber, int modelCode, int year) async {
  String resourceId = '5e87a7a1-2f6f-41c1-8aec-7216d52a6cf6';
  String code = modelCode.toString().padLeft(4, '0');
  String url = '$baseUrl?resource_id=$resourceId&q=$modelNumber+$code+$year';
  var json = await HttpClient(url).getData();
  return Model.fromJson(json);
}

Future<Extra> fetchBrandData(String brandName) async =>
    await FirestoreClient().brandData(brandName);

Future<Map<String, Logos>> _fetchLogos() async {
  var url =
      'https://cdn.jsdelivr.net/gh/avto-dev/vehicle-logotypes@2.x/src/vehicle-logotypes.json';
  var json = await HttpClient(url).getString();
  return logosFromJson(json);
}

Future<void> populateLogos() async {
  Map<String, Logos> logos = await _fetchLogos();
  FirestoreClient().updateLogos(logos);
}
