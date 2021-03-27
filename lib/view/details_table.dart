import 'package:carist/model/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsTable extends StatelessWidget {
  DetailsTable(this.data);

  final Base data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowHeight: 0,
          dividerThickness: 2.0,
          columns: [
            DataColumn(label: Text("")),
            DataColumn(label: Text("")),
          ],
          rows: [
            _textRow('details_model'.tr, data.model),
            _textRow('details_model_name'.tr, data.modelName),
            _textRow('details_version'.tr, data.version),
            _textRow('details_year'.tr, '${data.year}'),
          ],
        ),
      ),
    );
  }
}

DataRow _textRow(String title, String text) {
  return DataRow(
    cells: [
      DataCell(Text(title)),
      DataCell(Text(text)),
    ],
  );
}
