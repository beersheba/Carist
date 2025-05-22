import 'package:carist/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailsTable extends StatelessWidget {
  final DetailsController _detailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      headingRowHeight: 0,
      dividerThickness: 2.0,
      columnSpacing: 30,
      columns: [
        DataColumn(label: Text("")),
        DataColumn(label: Text("")),
      ],
      rows: getRows(),
    );
  }

  List<DataRow> getRows() {
    var rows = <DataRow>[];
    var data = _detailsController.rowsData();
    data.forEach((element) {
      rows.add(_dataRow(element));
    });
    return rows;
  }

  DataRow _dataRow(RowDetails detail) {
    var data = detail.value.toString();
    if (!(detail.units.isBlank ?? true)) {
      data = "$data ${detail.units}";
    }
    return DataRow(
      cells: [
        DataCell(Text(detail.title)),
        DataCell(
          Text(data, style: TextStyle(color: detail.textColor)),
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: data)).then((value) {
              Get.snackbar('copied'.tr, data);
            });
          },
        ),
      ],
    );
  }
}
