import 'dart:io';
import 'dart:convert';
import 'package:dart_algo/src/controllers/RoutePlanningController.dart';
import "package:dart_algo/src/services/DBService.dart";
import 'package:dart_algo/src/models/schema/Station.dart';
import 'package:dart_algo/src/services/StationService.dart';
import 'package:dart_algo/src/utils/JsonPretty.dart';
import 'package:dart_algo/src/utils/SearchAlgorithm/SearchAlgorithm.dart';
import 'package:dart_algo/src/utils/StationUtils.dart';

class System {
  static void dbConnect() {
    DBService();
  }

  static void run() {
    dbConnect();

    Station a = StationService.getStationById(id: "1");
    Station b = StationService.getStationById(id: "8");

    var result = RoutePlanningController.compareAlgo(
        src: a,
        dest: b,
        algo1: SearchAlgorithm.dfs,
        algo2: SearchAlgorithm.other);

    print(JsonPretty.getPrettyJson(result));
  }
}
