class Base {
  Base({
    this.number,
    this.model,
    this.modelName,
    this.modelCode,
    this.version,
    this.year,
    this.vin,
    this.engineCode,
    this.type,
    this.ownership,
    this.fuel,
    this.testDate,
    this.licenseValidity,
  });

  final int number;
  final String model;
  final String modelName;
  final int modelCode;
  final String version;
  final int year;
  final String vin;
  final String engineCode;
  final String type;
  final String ownership;
  final String fuel;
  final String testDate;
  final String licenseValidity;

  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
      number: json['result']['records'][0]['mispar_rechev'],
      model: json['result']['records'][0]['kinuy_mishari'],
      modelName: json['result']['records'][0]['degem_nm'],
      modelCode: json['result']['records'][0]['degem_cd'],
      version: json['result']['records'][0]['ramat_gimur'],
      year: json['result']['records'][0]['shnat_yitzur'],
      vin: json['result']['records'][0]['misgeret'],
      engineCode: json['result']['records'][0]['degem_manoa'],
      type: json['result']['records'][0]['sug_degem'],
      ownership: json['result']['records'][0]['baalut'],
      fuel: json['result']['records'][0]['sug_delek_nm'],
      testDate: json['result']['records'][0]['mivchan_acharon_dt'],
      licenseValidity: json['result']['records'][0]['tokef_dt'],
    );
  }
}

class Details {
  Details({
    this.brand,
    this.country,
    this.engineSize,
    this.weight,
    this.horsePower,
  });

  final String brand;
  final String country;
  final int engineSize;
  final int weight;
  final int horsePower;

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      brand: json['result']['records'][0]['tozar'],
      country: json['result']['records'][0]['tozeret_eretz_nm'],
      engineSize: json['result']['records'][0]['nefah_manoa'],
      weight: json['result']['records'][0]['mishkal_kolel'],
      horsePower: json['result']['records'][0]['koah_sus'],
    );
  }
}

class Extra {
  String brandEng;
  String countryEng;
  String logoUrl;
}
