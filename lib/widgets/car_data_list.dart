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
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Icon(data.icons[index]),
            title: Text('${data.titles[index]}: ${data.list[index]}'),
          ),
        );
      },
    );
  }
}
