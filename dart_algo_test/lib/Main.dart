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
        algo2: SearchAlgorithm.bfs);

    List<dynamic> z = result["SearchAlgorithm.dfs"]["possiblePath"];

    print("\nDepth-First Search\n");
    print("Src: $a To Dest: $b\n");
    for (int i = 0; i < z.length; i++) {
      print("${i + 1}: ${z[i]["path"]}\n");
    }

    List<dynamic> x = result["SearchAlgorithm.bfs"]["possiblePath"];

    print("\nBreadth-First Search\n");
    print("Src: $a To Dest: $b\n");
    for (int i = 0; i < x.length; i++) {
      print("${i + 1}: ${x[i]["path"]}\n");
    }
    // Mock.mockAdjacency();
  }
}
