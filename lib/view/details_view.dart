import 'package:carist/controller/number_controller.dart';
import 'package:carist/view/details_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final NumberController _numberController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_numberController.textController.text),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => Image.network(
                  _numberController.extra.value.logoUrl,
                  height: 150,
                  width: 150,
                )),
          ),
          Obx(() => DetailsTable(_numberController.base.value)),
        ],
      ),
    );
  }
}
