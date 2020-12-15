import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CarPlateField extends StatelessWidget {
  CarPlateField(this.carNumberFormatter);

  final MaskTextInputFormatter carNumberFormatter;

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
        hintText: '##-###-##',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (carNumberFormatter.isFill()) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
    );
  }
}
