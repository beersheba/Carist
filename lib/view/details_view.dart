import 'package:carist/controller/number_controller.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/view/car_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  final NumberController _numberController = Get.find();

  @override
  Widget build(BuildContext context) {
    final CarData data = Get.arguments;
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
            child: Image.network(
              data.extra.logoUrl,
              height: 150,
              width: 150,
            ),
          ),
          CarDataTable(data),
        ],
      ),
    );
  }
}
