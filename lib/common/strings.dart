import 'package:get/get.dart';

class Strings extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'error': 'Error',
          'error_number_invalid': 'Number is not valid',
          'error_number_not_found': 'Number not found',
          'number_title': 'Please scan or enter the vehicle number',
          'number_hint': '7 or 8 digits',
          'number_submit': 'Submit',
          'details_model': 'Model',
          'details_model_name': 'Model Name',
          'details_version': 'Version',
          'details_year': 'Year',
        },
        'he_IL': {
          'error': 'שגיאה',
          'error_number_invalid': 'המספר אינו חוקי',
          'error_number_not_found': 'המספר לא נמצא',
          'number_title': 'אנא סרוק או הזן את מספר הרכב',
          'number_hint': '7 או 8 ספרות',
          'number_submit': 'שלח',
          'details_model': 'כינוי מסחרי',
          'details_model_name': 'שם דגם',
          'details_version': 'רמת גימור',
          'details_year': 'שנת ייצור',
        }
      };
}
