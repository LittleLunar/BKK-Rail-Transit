import 'dart:io';
import 'dart:convert';
import 'package:dart_algo/src/controllers/RoutePlanningController.dart';
import 'package:dart_algo/src/models/schema/Adjacency.dart';
import "package:dart_algo/src/services/DBService.dart";
import 'package:dart_algo/src/models/schema/Station.dart';
import 'package:dart_algo/src/services/StationService.dart';
import 'package:dart_algo/src/utils/JsonPretty.dart';
import 'package:dart_algo/src/utils/Mocking.dart';
import 'package:dart_algo/src/utils/SearchAlgorithm/SearchAlgorithm.dart';
import 'package:dart_algo/src/utils/StationUtils.dart';

class System {
  static void dbConnect() {
    DBService();
  }

  static void run() {
    dbConnect();

    Station a =
        StationService.getStationByNameAndLine(name: "A1", lineNumber: 1);
    Station b =
        StationService.getStationByNameAndLine(name: "B13", lineNumber: 3);

    Map<String, dynamic> result = RoutePlanningController.compareAlgo(
        src: a,
        dest: b,
        algo1: SearchAlgorithm.dfs,
        algo2: SearchAlgorithm.other);

    print("\nSrc: $a To Dest: $b\n");
    List<dynamic> possiblePath = result["SearchAlgorithm.dfs"]["possiblePath"];
    for (int i = 0; i < possiblePath.length; i++) {
      print("${i + 1}: ${possiblePath[i]["path"]}");
    }
    // Mock.mockAdjacency();
  }
}
