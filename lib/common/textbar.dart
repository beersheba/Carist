import 'package:flutter/material.dart';

class TextBar {
  TextBar(this.text);

  final String text;

  SnackBar build() {
    return SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
