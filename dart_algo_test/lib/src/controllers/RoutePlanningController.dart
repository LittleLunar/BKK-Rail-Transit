import 'dart:io';
import 'package:collection/collection.dart';
import 'package:dart_algo/src/models/schema/Cost.dart';
import 'package:dart_algo/src/services/CostService.dart';
import 'package:dart_algo/src/utils/SearchAlgorithm/SearchAlgorithm.dart';
import 'package:dart_algo/src/utils/SearchAlgorithm/DFS.dart';
import 'package:dart_algo/src/models/schema/Station.dart';
import 'package:dart_algo/src/models/schema/Adjacency.dart';
import 'package:dart_algo/src/services/StationService.dart';
import 'package:dart_algo/src/services/AdjacencyService.dart';
import 'package:dart_algo/src/utils/StationUtils.dart';

class RoutePlanningController {
  static final List<Station> _stationContainer = StationService.getStations();
  static final List<Adjacency> _adjacencyContainer =
      AdjacencyService.getAdjacencies();
  static final List<Cost> _costContainer = CostService.getCosts();

  static Map<String, dynamic> compareAlgo(
      {required Station src,
      required Station dest,
      required SearchAlgorithm algo1,
      required SearchAlgorithm algo2}) {
    return <String, dynamic>{
      "$algo1": possiblePath(src: src, dest: dest, algo: SearchAlgorithm.dfs),
      "$algo2": possiblePath(src: src, dest: dest, algo: SearchAlgorithm.other)
    };
  }

  static Map<String, dynamic> possiblePath(
      {required Station src,
      required Station dest,
      SearchAlgorithm algo = SearchAlgorithm.dfs}) {
    Map<String, dynamic> success = {};

    final stopwatch = Stopwatch()..start();

    if (algo == SearchAlgorithm.dfs) {
      DFS.traverse(cur: src, dest: dest, success: success);
    }

    if (algo == SearchAlgorithm.agentDFS) {}

    final elapsedTime = stopwatch.elapsed;

    return <String, dynamic>{
      "timeused": elapsedTime.toString(),
      "possiblePath": success
    };
  }
}
