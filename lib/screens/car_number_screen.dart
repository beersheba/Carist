import 'dart:ui';

import 'package:carist/common/style.dart';
import 'package:carist/common/textbar.dart';
import 'package:carist/model/api.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/screens/car_details_screen.dart';
import 'package:carist/widgets/car_number_field.dart';
import 'package:flutter/material.dart';

import '../common/const.dart';

class CarNumberScreen extends StatelessWidget {
  static const routeName = 'CarNumberScreen';

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: NetworkImage(logo),
                  color: Colors.white,
                  height: 50.0,
                ),
                Column(
                  children: [
                    Text(
                      'Enter the license plate number',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 30.0),
                    CarNumberField(controller: textController),
                  ],
                ),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    var carNumber = textController.text.replaceAll('-', '');
                    if (carNumber.length < 7) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(TextBar('Number too short').build());
                    } else {
                      try {
                        CarData data = CarData();
                        data.base = await fetchBaseData(carNumber);
                        if (data.base != null) {
                          data.model = await fetchModelData(
                              data.base.modelNumber,
                              data.base.modelCode,
                              data.base.year);
                          data.extra = await fetchBrandData(data.model.brand);
                          data.extra.formattedNumber = textController.text;
                          Navigator.pushNamed(
                              context, CarDetailsScreen.routeName,
                              arguments: data);
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(TextBar('Number not found').build());
                      }
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
