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
              children: [
                SizedBox(height: size.height / 7),
                Text(
                  'number_title'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.width / 17),
                ),
                SizedBox(height: size.height / 40),
                NumberField(
                  controller: _numberController.textController,
                  onConfirm: (_) async => _numberController.submitNumber(),
                ),
                SizedBox(height: size.height / 30),
                OutlinedButton(
                  style: outlinedButtonStyle,
                  child: Text(
                    'number_submit'.tr,
                    style: TextStyle(
                      fontSize: 23.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async => _numberController.submitNumber(),
                ),
                Spacer(),
                Image.asset(
                  'assets/images/mot-logo.png',
                  color: Colors.white,
                ),
                SizedBox(height: size.height / 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
