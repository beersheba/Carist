import 'package:carist/controller/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DetailsTable extends StatelessWidget {
  final DetailsController detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          showCheckboxColumn: false,
          headingRowHeight: 0,
          dividerThickness: 2.0,
          columns: [
            DataColumn(label: Text("")),
            DataColumn(label: Text("")),
          ],
          rows: getRows(),
        ),
      ),
    );
  }

  List<DataRow> getRows() {
    var rowsList = <DataRow>[];
    var details = detailsController.getDetails();
    details.forEach((element) {
      rowsList.add(_dataRow(element));
    });
    return rowsList;
  }

  DataRow _dataRow(RowDetails detail) {
    var data = detail.value.toString();
    if (!detail.units.isBlank) {
      data = "$data ${detail.units}";
    }
    return DataRow(
      cells: [
        DataCell(Text(detail.title)),
        DataCell(Text(data, style: TextStyle(color: detail.textColor))),
      ],
      onSelectChanged: (_) {
        Clipboard.setData(ClipboardData(text: data)).then((value) {
          Get.snackbar('copied'.tr, data);
        });
      },
    );
  }
}
