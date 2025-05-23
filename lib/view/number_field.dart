import 'package:carist/common/number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NumberField extends StatefulWidget {
  NumberField({required this.controller, required this.onConfirm});

  final TextEditingController controller;
  final VoidCallback? onConfirm;

  @override
  State<NumberField> createState() => _NumberFieldState();
}

class _NumberFieldState extends State<NumberField> {
  var border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );

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
        focusedBorder: border,
        enabledBorder: border,
        hintText: 'number_hint'.tr,
      ),
      keyboardType: TextInputType.number,
      controller: widget.controller,
      onSubmitted: (_) => widget.onConfirm?.call(),
      onEditingComplete: () {},
    );
  }
}
