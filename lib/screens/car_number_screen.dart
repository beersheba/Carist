import 'dart:ui';

import 'package:carist/model/api.dart';
import 'package:carist/model/car_data.dart';
import 'package:carist/screens/car_details_screen.dart';
import 'package:carist/widgets/car_number_field.dart';
import 'package:flutter/material.dart';

import '../common/const.dart';

class CarNumberScreen extends StatefulWidget {
  static const routeName = 'CarNumberScreen';

  @override
  _CarNumberScreenState createState() => _CarNumberScreenState();
}

class _CarNumberScreenState extends State<CarNumberScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  String enteredNumber;
  String formattedNumber;

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
                    CarNumberField(onTextChanged: (value) {
                      formattedNumber = value;
                      enteredNumber =
                          value.toString().replaceAll(RegExp(r'-'), '');
                    }),
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
                    var carNumber = enteredNumber;
                    if (carNumber.length == 7 || carNumber.length == 8) {
                      try {
                        CarData data = CarData();
                        data.base = await Api().fetchBaseData(carNumber);
                        if (data.base != null) {
                          data.model = await Api().fetchModelData(
                              data.base.modelNumber,
                              data.base.modelCode,
                              data.base.year);
                          data.extra =
                              await Api().fetchBrandData(data.model.brand);
                          data.extra.formattedNumber = formattedNumber;
                          Navigator.pushNamed(
                              context, CarDetailsScreen.routeName,
                              arguments: data);
                        }
                      } catch (e) {
                        final snackBar = SnackBar(
                          content: Text(
                            'Number not found',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.grey.shade900,
                        );
                        globalKey.currentState.showSnackBar(snackBar);
                      }
                    } else {
                      //Display snackbar "Number is wrong"
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
