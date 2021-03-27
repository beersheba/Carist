class Base {
  Base(
      {this.number,
      this.model,
      this.modelName,
      this.modelCode,
      this.version,
      this.year});

  final int number;
  final String model;
  final String modelName;
  final int modelCode;
  final String version;
  final int year;

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
        number: json['result']['records'][0]['mispar_rechev'],
        model: json['result']['records'][0]['kinuy_mishari'],
        modelName: json['result']['records'][0]['degem_nm'],
        modelCode: json['result']['records'][0]['degem_cd'],
        version: json['result']['records'][0]['ramat_gimur'],
        year: json['result']['records'][0]['shnat_yitzur']);
  }
}

class Model {
  Model({this.brand, this.country});

  final String brand;
  final String country;

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        brand: json['result']['records'][0]['tozar'],
        country: json['result']['records'][0]['tozeret_eretz_nm']);
  }
}

class Extra {
  String brandEng;
  String countryEng;
  String logoUrl;
}
