import 'package:carist/common/http_client.dart';
import 'package:carist/model/car_data.dart';

const String baseUrl = 'https://data.gov.il/api/action/datastore_search';

class Api {
  Future<CarData> fetchBasicData(String carNumber) async {
    String resourceId = '053cea08-09bc-40ec-8f7a-156f0677aff3';
    String url = '$baseUrl?resource_id=$resourceId&q=$carNumber';
    var json = await HttpClient(url).getData();
    return CarData.fromJson(json);
  }
}
