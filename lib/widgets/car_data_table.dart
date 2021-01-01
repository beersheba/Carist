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
            DataRow(cells: [
              DataCell(Text('Car model')),
              DataCell(Text(data.base.carModel)),
            ]),
            DataRow(cells: [
              DataCell(Text('Model Number')),
              DataCell(Text(data.base.modelNumber)),
            ]),
            DataRow(cells: [
              DataCell(Text('Version')),
              DataCell(Text(data.base.version)),
            ]),
            DataRow(cells: [
              DataCell(Text('Year')),
              DataCell(Text('${data.base.year}')),
            ]),
          ],
        ),
      ),
    );
  }
}
