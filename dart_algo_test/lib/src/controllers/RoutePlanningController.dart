import 'dart:io';
import 'package:dart_algo/src/models/schema/Station.dart';

class RoutePlanningController {
  static void possiblePath(
      {required Station source, required Station destination}) {}

  static void pathRecursion(
      Station cur, Station destination, List<List<String>> success,
      {Set<Station>? visited}) {}
}
