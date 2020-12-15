import 'dart:ui';

import 'package:carist/widgets/car_number_field.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../const.dart';

class EnterPlateScreen extends StatelessWidget {
  final MaskTextInputFormatter carNumberFormatter = new MaskTextInputFormatter(
    mask: '##-###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
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
                    CarPlateField(carNumberFormatter),
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
                  onPressed: () {
                    if (carNumberFormatter.isFill()) {
                      var carNumber = carNumberFormatter.getUnmaskedText();
                      print('Submitting car number: $carNumber');
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
