import 'package:flutter/services.dart';

class NumberFormatter extends TextInputFormatter {
  final String separator = '-';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    var string = formatNumber(text);
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }

  String formatNumber(String text) {
    var firstDelimiterIndex = 2;
    var secondDelimiterIndex = 5;
    if (text.length > 7) {
      firstDelimiterIndex = 3;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if ((nonZeroIndex == firstDelimiterIndex ||
              nonZeroIndex == secondDelimiterIndex) &&
          nonZeroIndex != text.length) {
        buffer.write(separator);
      }
    }
    return buffer.toString();
  }
}
