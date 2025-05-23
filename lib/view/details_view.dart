import 'package:carist/common/number_formatter.dart';
import 'package:carist/controller/details_controller.dart';
import 'package:carist/view/details_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsView extends StatelessWidget {
  final DetailsController _detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var imageHeight = size.height / 7;
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Screenshot(
          controller: _detailsController.screenshotController,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.width / 50),
                    child: _detailsController.logoUrl().isEmpty
                        ? Image.memory(kTransparentImage, height: imageHeight)
                        : FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: _detailsController.logoUrl(),
                            height: imageHeight,
                          ),
                  ),
                  DetailsTable(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
