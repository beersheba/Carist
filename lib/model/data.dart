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
  final String modelCode;
  final String version;
  final String year;
  final String vin;
  final String engineCode;
  final String type;
  final String ownership;
  final String fuel;
  final String testDate;
  final String licenseValidity;

  factory Base.fromJson(Map<String, dynamic> json) {
    List data = json['result']['records'];
    return data.isNotEmpty
        ? Base(
            number: data[0]['mispar_rechev'],
            model: data[0]['kinuy_mishari'],
            modelName: data[0]['degem_nm'],
            modelCode: data[0]['degem_cd'],
            version: data[0]['ramat_gimur'],
            year: data[0]['shnat_yitzur'],
            vin: data[0]['misgeret'],
            engineCode: data[0]['degem_manoa'],
            type: data[0]['sug_degem'],
            ownership: data[0]['baalut'],
            fuel: data[0]['sug_delek_nm'],
            testDate: data[0]['mivchan_acharon_dt'],
            licenseValidity: data[0]['tokef_dt'],
          )
        : null;
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
  final String engineSize;
  final String weight;
  final String horsePower;

  factory Details.fromJson(Map<String, dynamic> json) {
    List data = json['result']['records'];
    return data.isNotEmpty
        ? Details(
            brand: data[0]['tozar'],
            country: data[0]['tozeret_eretz_nm'],
            engineSize: data[0]['nefah_manoa'],
            weight: data[0]['mishkal_kolel'],
            horsePower: data[0]['koah_sus'],
          )
        : null;
  }
}

class Importer {
  Importer({this.price, this.code, this.name});

  final int price;
  final int code;
  final String name;

  factory Importer.fromJson(Map<String, dynamic> json) {
    List data = json['result']['records'];
    return data.isNotEmpty
        ? Importer(
            price: data[0]['mehir'],
            code: data[0]['semel_yevuan'],
            name: data[0]['shem_yevuan'],
          )
        : null;
  }
}

class Extra {
  String brandEng;
  String countryEng;
  String logoUrl;
}
