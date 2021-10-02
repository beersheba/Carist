import 'dart:ui';

import 'package:carist/common/locales.dart';
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(size.height / 50),
                child: Align(
                  alignment: Get.locale == localeIl
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: DropdownButton(
                    icon: Icon(
                      Icons.language_outlined,
                      color: Colors.white,
                      size: size.height / 25,
                    ),
                    items: Language.values.map((Language language) {
                      return DropdownMenuItem<Language>(
                        value: language,
                        child: Align(child: Text(language.name)),
                      );
                    }).toList(),
                    underline: SizedBox(),
                    onChanged: (value) {
                      _numberController.setLocale(value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: size.height / 7),
                    Text(
                      'number_title'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: size.width / 16),
                    ),
                    SizedBox(height: size.height / 30),
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
                    SizedBox(height: size.height / 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
