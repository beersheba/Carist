class Base {
  Base({
    required this.number,
    required this.model,
    required this.modelName,
    required this.modelCode,
    required this.version,
    required this.year,
    required this.vin,
    required this.engineCode,
    required this.type,
    required this.ownership,
    required this.fuel,
    required this.testDate,
    required this.licenseValidity,
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
    List data = json['result']['records'];
    if (data.isNotEmpty) {
      return Base(
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
      );
    } else {
      throw Exception('No data found');
    }
  }
}

class Details {
  Details({
    required this.brand,
    required this.country,
    required this.engineSize,
    required this.weight,
    required this.horsePower,
  });

  final String brand;
  final String country;
  final int engineSize;
  final int weight;
  final int horsePower;

  factory Details.fromJson(Map<String, dynamic> json) {
    List data = json['result']['records'];
    if (data.isNotEmpty) {
      return Details(
        brand: data[0]['tozar'],
        country: data[0]['tozeret_eretz_nm'],
        engineSize: data[0]['nefah_manoa'],
        weight: data[0]['mishkal_kolel'],
        horsePower: data[0]['koah_sus'],
      );
    } else {
      throw Exception('No data found');
    }
  }
}

class Importer {
  Importer({
    required this.price,
    required this.code,
    required this.name,
  });

  final int price;
  final int code;
  final String name;

  factory Importer.fromJson(Map<String, dynamic> json) {
    List data = json['result']['records'];
    if (data.isNotEmpty) {
      return Importer(
        price: data[0]['mehir'],
        code: data[0]['semel_yevuan'],
        name: data[0]['shem_yevuan'],
      );
    } else {
      throw Exception('No data found');
    }
  }
}

class Extra {
  Extra({
    required this.brandEng,
    required this.countryEng,
    required this.logoUrl,
  });

  final String brandEng;
  final String countryEng;
  final String logoUrl;
}
