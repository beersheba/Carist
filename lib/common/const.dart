import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String logo = 'https://upload.wikimedia.org/wikipedia/he/thumb/a/a3'
    '/Israeli_Ministry_of_Transport_and_Road_Safety_Symbol.svg/'
    '300px-Israeli_Ministry_of_Transport_and_Road_Safety_Symbol.svg.png';

const String zeroMask = '7 or 8 digits';
const String sevenMask = '##-###-##';
const String eightMask = '###-##-###';

final MaskTextInputFormatter carNumberFormatter = MaskTextInputFormatter(
  mask: sevenMask,
  filter: {"#": RegExp(r'[0-9]')},
);
