import 'package:carist/common/const.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/widgets/car_data_list.dart';
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
      body: Container(
        child: Column(children: [
          Image.network(
            'https://vl.imgix.net//img//seat-logo.png',
            height: 200,
            width: 200,
          ),
          CarDataList(data),
        ]),
      ),
    );
  }
}
