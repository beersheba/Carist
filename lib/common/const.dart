import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

const String logo = 'https://upload.wikimedia.org/wikipedia/he/thumb/a/a3'
    '/Israeli_Ministry_of_Transport_and_Road_Safety_Symbol.svg/'
    '300px-Israeli_Ministry_of_Transport_and_Road_Safety_Symbol.svg.png';

final MaskTextInputFormatter carNumberFormatter = MaskTextInputFormatter(
  mask: '##-###-##',
  filter: {"#": RegExp(r'[0-9]')},
);
