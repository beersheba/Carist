class CarData {
  Base base = Base();
  WLTP wltp = WLTP();
  Translate translate = Translate();
}

class Base {
  Base(
      {this.carNumber,
      this.carModel,
      this.modelNumber,
      this.modelCode,
      this.version,
      this.year});

  final int carNumber;
  final String carModel;
  final String modelNumber;
  final int modelCode;
  final String version;
  final int year;

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
        carNumber: json['result']['records'][0]['mispar_rechev'],
        carModel: json['result']['records'][0]['kinuy_mishari'],
        modelNumber: json['result']['records'][0]['degem_nm'],
        modelCode: json['result']['records'][0]['degem_cd'],
        version: json['result']['records'][0]['ramat_gimur'],
        year: json['result']['records'][0]['shnat_yitzur']);
  }

  List<String> get list => ['$carModel', '$modelNumber', '$version', '$year'];

  List<String> get titles => ['Car model', 'Model Number', 'Version', 'Year'];

  int get length => list.length;
}

class WLTP {
  WLTP({this.brand, this.country});

  final String brand;
  final String country;

  factory WLTP.fromJson(Map<String, dynamic> json) {
    return WLTP(
        brand: json['result']['records'][0]['tozar'],
        country: json['result']['records'][0]['tozeret_eretz_nm']);
  }
}

class Translate {

  String _brandEng;
  String _countryEng;

  String get brandEng => _brandEng;

  set brandEng(String brandEng) {
    _brandEng = brandEng;
  }

}
