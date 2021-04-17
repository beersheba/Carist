import 'package:carist/controller/details_controller.dart';
import 'package:carist/controller/number_controller.dart';
import 'package:carist/model/data.dart';
import 'package:carist/view/details_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _detailsController = Get.put(DetailsController());
  final NumberController _numberController = Get.find();

  @override
  Widget build(BuildContext context) {
    Rx<Extra> extra = _detailsController.extra;
    return Scaffold(
      appBar: AppBar(
        title: Text(_numberController.textController.text),
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
