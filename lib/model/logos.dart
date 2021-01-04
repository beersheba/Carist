import 'dart:convert';

Map<String, Logos> logosFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Logos>(k, Logos.fromJson(v)));

class Logos {
  Logos({this.name, this.logotype});

  final String name;
  final Logotype logotype;

  factory Logos.fromJson(Map<String, dynamic> json) => Logos(
        name: json["name"],
        logotype: Logotype.fromJson(json["logotype"]),
      );
}

class Logotype {
  Logotype({this.uri});

  final String uri;

  factory Logotype.fromJson(Map<String, dynamic> json) =>
      Logotype(uri: json["uri"]);
}
