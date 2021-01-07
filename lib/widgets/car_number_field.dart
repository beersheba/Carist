import 'package:carist/common/car_number_formatter.dart';
import 'package:carist/common/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarNumberField extends StatelessWidget {
  CarNumberField({this.onTextChanged});

  final Function onTextChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(8),
        CarNumberTextFormatter(),
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
        hintText: carNumberHint,
      ),
      keyboardType: TextInputType.number,
      onChanged: onTextChanged,
    );
  }
}
