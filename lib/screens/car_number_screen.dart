import 'dart:ui';

import 'package:carist/model/api.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/screens/car_details_screen.dart';
import 'package:carist/widgets/car_number_field.dart';
import 'package:flutter/material.dart';

import '../common/const.dart';

class CarNumberScreen extends StatelessWidget {
  static const routeName = 'CarNumberScreen';

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
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
                    CarNumberField(),
                  ],
                ),
                OutlineButton(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  borderSide: BorderSide(color: Colors.white),
                  highlightedBorderColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () async {
                    if (carNumberFormatter.isFill()) {
                      var carNumber = carNumberFormatter.getUnmaskedText();
                      try {
                        CarData data = CarData();
                        data.base = await Api().fetchBaseData(carNumber);
                        if (data.base != null) {
                          data.wltp = await Api().fetchWltpData(
                              data.base.modelNumber,
                              data.base.modelCode,
                              data.base.year);
                          Navigator.pushNamed(
                              context, CarDetailsScreen.routeName,
                              arguments: data);
                        }
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(
                            'No data',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.grey.shade900,
                        );
                        globalKey.currentState.showSnackBar(snackBar);
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
