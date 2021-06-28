import 'dart:ui';

import 'package:carist/common/style.dart';
import 'package:carist/controller/number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'number_field.dart';

class NumberView extends StatelessWidget {
  final NumberController _numberController = Get.put(NumberController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/mot-logo.png',
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      'number_title'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23.0),
                    ),
                    SizedBox(height: size.height / 30),
                    NumberField(
                      controller: _numberController.textController,
                      onConfirm: (_) async => _numberController.submitNumber(),
                    ),
                  ],
                ),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  child: Text(
                    'number_submit'.tr,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async => _numberController.submitNumber(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
