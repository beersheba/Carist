import 'dart:ui';

import 'package:carist/common/style.dart';
import 'package:carist/controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/const.dart';
import 'car_number_field.dart';

class NumberView extends StatelessWidget {
  final NumberController _numberController = Get.put(NumberController());

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
                    CarNumberField(
                        controller: _numberController.textController),
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
                    _numberController.submitNumber();
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
