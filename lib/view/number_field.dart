import 'package:carist/common/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NumberField extends StatelessWidget {
  NumberField({this.controller, this.onConfirm});

  final TextEditingController controller;
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
        NumberFormatter(),
      ],
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25.0),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
        ),
        hintText: 'number_hint'.tr,
      ),
      keyboardType: TextInputType.number,
      controller: controller,
      onSubmitted: onConfirm,
    );
  }
}
