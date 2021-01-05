import 'package:carist/common/const.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/widgets/car_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  static const routeName = 'CarDetailsScreen';

  @override
  Widget build(BuildContext context) {
    final CarData data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title:
            Text(carNumberFormatter.maskText(data.base.carNumber.toString())),
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
          // CarDataList(data),
          CarDataTable(data),
        ],
      ),
    );
  }
}
