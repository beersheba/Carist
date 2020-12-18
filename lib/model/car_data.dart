import 'package:flutter/material.dart';

class CarData {
  CarData({this.carNumber, this.carModel, this.modelNumber, this.version, this.year});

  final int carNumber;
  final String carModel;
  final String modelNumber;
  final String version;
  final int year;

  factory CarData.fromJson(Map<String, dynamic> json) {
    return CarData(
        carNumber: json['result']['records'][0]['mispar_rechev'],
        carModel: json['result']['records'][0]['kinuy_mishari'],
        modelNumber: json['result']['records'][0]['degem_nm'],
        version: json['result']['records'][0]['ramat_gimur'],
        year: json['result']['records'][0]['shnat_yitzur']);
  }

  List<String> get list => ['$carModel', '$modelNumber', '$version', '$year'];

  List<String> get titles => ['Car model', 'Model Number', 'Version', 'Year'];

  List<IconData> get icons => [
        Icons.looks_one_outlined,
        Icons.looks_two_outlined,
        Icons.looks_3_outlined,
        Icons.looks_4_outlined
      ];

  int get length => list.length;
}
