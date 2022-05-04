import 'package:dart_algo/src/models/schema/Station.dart';

class StationUtils {
  static bool isTransition({required Station s1, required Station s2}) {

    if (s1.lineNumber != s2.lineNumber) return false;

    return true;
  }
}
