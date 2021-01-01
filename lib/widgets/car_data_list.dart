import 'package:carist/model/car_data.dart';
import 'package:flutter/material.dart';

class CarDataList extends StatelessWidget {
  CarDataList(this.data);

  final CarData data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.base.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('${data.base.titles[index]}')),
                Expanded(flex: 1, child: Text('${data.base.list[index]}'))
              ],
            ),
          ),
        );
      },
    );
  }
}