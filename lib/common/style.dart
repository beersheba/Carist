import 'package:flutter/material.dart';

final ButtonStyle outlinedButtonStyle = ButtonStyle(
  shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
  side: WidgetStateProperty.all<BorderSide>(BorderSide(color: Colors.white)),
  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(vertical: 15.0)),
  overlayColor: WidgetStateProperty.all<Color>(Colors.grey.shade700),
);
