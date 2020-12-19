import 'package:carist/common/http_client.dart';
import 'package:carist/model/car_data.dart';

const String baseUrl = 'https://data.gov.il/api/action/datastore_search';

class Api {
  Future<Base> fetchBaseData(String carNumber) async {
    String resourceId = '053cea08-09bc-40ec-8f7a-156f0677aff3';
    String url = '$baseUrl?resource_id=$resourceId&q=$carNumber';
    var json = await HttpClient(url).getData();
    return Base.fromJson(json);
  }

  Future<WLTP> fetchWltpData(
      String modelNumber, int modelCode, int year) async {
    String resourceId = '142afde2-6228-49f9-8a29-9b6c3a0cbe40';
    String code = modelCode.toString().padLeft(4, '0');
    String url = '$baseUrl?resource_id=$resourceId&q=$modelNumber+$code+$year';
    var json = await HttpClient(url).getData();
    return WLTP.fromJson(json);
  }
}
