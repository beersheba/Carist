import 'package:carist/common/number_formatter.dart';
import 'package:carist/controller/details_controller.dart';
import 'package:carist/view/details_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              _detailsController.shareScreenshot();
            },
          )
        ],
        title: Text(
          NumberFormatter().formatNumber(
            _detailsController.number(),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: _detailsController.logoUrl() == null
                  ? Image.memory(kTransparentImage, height: 150)
                  : FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: _detailsController.logoUrl(),
                      height: 150,
                    ),
            ),
            DetailsTable(),
          ],
        ),
      ),
    );
  }
}
