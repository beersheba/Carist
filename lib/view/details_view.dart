import 'package:carist/common/number_formatter.dart';
import 'package:carist/controller/data_controller.dart';
import 'package:carist/view/details_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatelessWidget {
  final DataController _dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    var extra = _dataController.extra;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          NumberFormatter().formatNumber(
            _dataController.base.value.number.toString(),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Obx(
                () => extra.value.logoUrl == null
                    ? Image.memory(kTransparentImage, height: 150)
                    : FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: extra.value.logoUrl,
                        height: 150,
                      ),
              ),
            ),
            DetailsTable(),
          ],
        ),
      ),
    );
  }
}
