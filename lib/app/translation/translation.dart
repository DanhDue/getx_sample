import 'english.dart';
import 'vietnamese.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "vi_VI": viVI
  };
}
