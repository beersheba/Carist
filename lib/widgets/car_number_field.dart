import 'package:carist/common/const.dart';
import 'package:flutter/material.dart';

class CarNumberField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      showCursor: false,
      inputFormatters: [carNumberFormatter],
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
        hintText: zeroMask,
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        int length = carNumberFormatter.getUnmaskedText().length;
        if (length == 7) {
          if (carNumberFormatter.getMask() == sevenMask) {
            carNumberFormatter.updateMask(mask: eightMask);
          } else {
            carNumberFormatter.updateMask(mask: sevenMask);
          }
        }
      },
    );
  }
}
