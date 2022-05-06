import 'dart:convert';

class JsonPretty {
  static String getPrettyJson(Object? object) {
    JsonEncoder encoder = JsonEncoder.withIndent("  ");
    return encoder.convert(object);
  }
}
