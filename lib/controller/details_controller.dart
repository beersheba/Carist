import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:carist/controller/data_controller.dart';
import 'package:carist/model/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class DetailsController extends GetxController {
  Base _base;
  Details _details;
  Importer _importer;
  Extra _extra;

  var _rowsData = <RowDetails>[];

  ScreenshotController _screenshotController = ScreenshotController();

  ScreenshotController get screenshotController => _screenshotController;

  @override
  void onInit() {
    DataController _dataController = Get.find();
    _base = _dataController.base;
    _details = _dataController.details;
    _importer = _dataController.importer;
    _extra = _dataController.extra;
    _initDetailsList();
    super.onInit();
  }

  void _initDetailsList() {
    _addDetail(RowDetails('details_model'.tr, _vehicleName()));
    _addDetail(RowDetails('details_version'.tr, _base.version));
    _addDetail(RowDetails('details_price'.tr, _getCarPrice()));
    _addDetail(RowDetails(
        'details_license_valid'.tr, _formatDate(_base.licenseValidity),
        textColor: _dateColor(_base.licenseValidity)));
    _addDetail(RowDetails('details_year'.tr, _base.year));
    _addDetail(RowDetails('details_ownership'.tr, _base.ownership));
    _addDetail(RowDetails('details_engine_size'.tr, _details?.engineSize,
        units: 'details_cc'.tr));
    _addDetail(RowDetails('details_horsepower'.tr, _details?.horsePower));
    _addDetail(RowDetails('details_fuel'.tr, _base.fuel));
    _addDetail(RowDetails('details_weight'.tr, _details?.weight,
        units: 'details_kilo'.tr));
    _addDetail(RowDetails('details_vin'.tr, _base.vin));
    _addDetail(RowDetails('details_last_test'.tr, _formatDate(_base.testDate)));
  }

  void _addDetail(RowDetails detail) {
    if (detail.value == null || detail.value == '' || detail.value == 0) return;
    _rowsData.add(detail);
  }

  String _vehicleName() {
    String brand = _extra?.brandEng;
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

  List<RowDetails> rowsData() {
    return _rowsData;
  }

  String number() {
    return _base.number.toString();
  }

  String logoUrl() {
    return _extra.logoUrl;
  }

  Future shareScreenshot() async {
    await _screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((Uint8List image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(image);
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        String appName = packageInfo.appName;
        String version = packageInfo.version;
        await Share.shareFiles([imagePath.path],
            text: 'Made by $appName v$version (${Platform.operatingSystem})');
      }
    });
  }

  String _getCarPrice() {
    int price = _importer?.price;
    return price != null
        ? NumberFormat.simpleCurrency(locale: 'he_IL', decimalDigits: 0)
            .format(price)
        : price;
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
