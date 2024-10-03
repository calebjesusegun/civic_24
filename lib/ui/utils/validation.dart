import 'package:civic_24/ui/utils/string_utils.dart';
import '../common/app_strings.dart';

class Validation {
  static String? validateField(String? s, [String? errorMessage]) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? AppText.ksRequired;
    } else {
      return null;
    }
  }
}
