import 'package:carist/model/car_data.dart';
import 'package:flutter/material.dart';

class CarDataTable extends StatelessWidget {
  CarDataTable(this.data);

  final CarData data;

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
            _textRow('Car model', data.base.carModel),
            _textRow('Model Number', data.base.modelNumber),
            _textRow('Version', data.base.version),
            _textRow('Year', '${data.base.year}'),
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
