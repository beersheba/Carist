import 'package:flutter/material.dart';

final ButtonStyle outlinedButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
  side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.white)),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.symmetric(vertical: 15.0)),
  overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade700),
);
