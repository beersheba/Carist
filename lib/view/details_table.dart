import 'package:carist/controller/details_controller.dart';
import 'package:carist/controller/number_controller.dart';
import 'package:carist/model/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailsTable extends StatelessWidget {
  final NumberController _numberController = Get.find();
  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    Base base = _numberController.base.value;
    Rx<Details> details = _detailsController.details;

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => DataTable(
            headingRowHeight: 0,
            dividerThickness: 2.0,
            columns: [
              DataColumn(label: Text("")),
              DataColumn(label: Text("")),
            ],
            rows: [
              _textRow('details_model'.tr, _vehicleName()),
              _textRow('details_version'.tr, base.version),
              _textRow('details_year'.tr, base.year),
              _textRow('details_engine_size'.tr, details.value.engineSize),
              _textRow('details_fuel'.tr, base.fuel),
              _textRow('details_horse_power'.tr, details.value.horsePower),
              _textRow('details_ownership'.tr, base.ownership),
              _textRow('details_weight'.tr, details.value.weight),
              _textRow('details_vin'.tr, base.vin),
              _textRow('details_test'.tr, _formatDate(base.testDate)),
              _textRow('details_test_valid'.tr, _formatDate(base.testValidity)),
            ],
          ),
        ),
      ),
    );
  }

  String _vehicleName() {
    String brand = _detailsController.extra.value.brandEng;
    if (brand == null) return null;
    String model = _numberController.base.value.model;
    if (model.isCaseInsensitiveContains(brand)) {
      return model;
    }
    return ('${brand.toUpperCase()} $model');
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat("dd/MM/yyyy").format(dateTime);
  }

  int _daysLeft(String date) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.difference(DateTime.now()).inDays;
  }
}

String _vehicleType(String type) {
  String vehicleType = 'details_type_private'.tr;
  if (type == 'M') {
    vehicleType = 'details_type_commercial'.tr;
  }
  return vehicleType;
}

DataRow _textRow(String title, var value) {
  return DataRow(
    cells: [
      DataCell(Text(title)),
      DataCell(value == null ? Text('-') : Text(value.toString())),
    ],
  );
}
