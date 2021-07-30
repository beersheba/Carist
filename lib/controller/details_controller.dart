import 'dart:ui';

import 'package:carist/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsController extends GetxController {
  var _base;
  var _details;
  var _extra;

  var _detailsList = <RowDetails>[];

  @override
  void onInit() {
    DataController _dataController = Get.find();
    _base = _dataController.base.value;
    _details = _dataController.details.value;
    _extra = _dataController.extra.value;
    _initDetailsList();
    super.onInit();
  }

  void _initDetailsList() {
    _addDetail(RowDetails('details_model'.tr, _vehicleName()));
    _addDetail(RowDetails('details_version'.tr, _base.version));
    _addDetail(RowDetails('details_year'.tr, _base.year));
    _addDetail(RowDetails('details_engine_size'.tr, _details.engineSize,
        units: 'details_cc'.tr));
    _addDetail(RowDetails('details_fuel'.tr, _base.fuel));
    _addDetail(RowDetails('details_horse_power'.tr, _details.horsePower));
    _addDetail(RowDetails('details_ownership'.tr, _base.ownership));
    _addDetail(RowDetails('details_weight'.tr, _details.weight,
        units: 'details_kilo'.tr));
    _addDetail(RowDetails('details_vin'.tr, _base.vin));
    _addDetail(RowDetails('details_last_test'.tr, _formatDate(_base.testDate)));
    _addDetail(RowDetails(
        'details_license_valid'.tr, _formatDate(_base.licenseValidity),
        textColor: _dateColor(_base.licenseValidity)));
  }

  void _addDetail(RowDetails detail) {
    if (detail.value == null || detail.value == '' || detail.value == 0) return;
    _detailsList.add(detail);
  }

  String _vehicleName() {
    String brand = _extra.brandEng;
    if (brand == null) return null;
    String model = _base.model;
    if (model.isCaseInsensitiveContains(brand)) {
      return model;
    }
    return ('${brand.toUpperCase()} $model');
  }

  String _vehicleType(String type) {
    String vehicleType = 'details_type_private'.tr;
    if (type == 'M') {
      vehicleType = 'details_type_commercial'.tr;
    }
    return vehicleType;
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  Color _dateColor(String date) {
    return _daysLeft(date) < _daysInCurrentMonth(date)
        ? Colors.red
        : Colors.white;
  }

  int _daysLeft(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.difference(DateTime.now()).inDays;
  }

  int _daysInCurrentMonth(String date) {
    DateTime dateTime = DateTime.now();
    return DateTime(dateTime.year, dateTime.month + 1, 0).day;
  }

  List<RowDetails> getDetails() {
    return _detailsList;
  }
}

class RowDetails {
  String title;
  var value;
  Color textColor;
  String units;

  RowDetails(this.title, this.value,
      {this.textColor = Colors.white, this.units = ''});
}
