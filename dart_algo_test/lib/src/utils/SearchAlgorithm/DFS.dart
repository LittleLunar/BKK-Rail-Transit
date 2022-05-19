import 'package:collection/collection.dart';
import '../../models/schema/Adjacency.dart';
import '../../models/schema/Station.dart';
import '../../services/AdjacencyService.dart';
import '../../services/StationService.dart';

class DFS {
  static final List<Station> _stationContainer = StationService.getStations();
  static final List<Adjacency> _adjacencyContainer =
      AdjacencyService.getAdjacencies();

  static void traverse(
      {required Station cur,
      required Station dest,
      required List<dynamic> success,
      List<Station>? visited,
      Map<String, dynamic>? totalCost,
      Station? firstStationInLine}) {
    firstStationInLine ??= cur;
    totalCost ??= {"price": 0, "duration": 0};
    visited ??= [];
    visited.add(cur);

    // terminate recursion
    if (cur.id == dest.id) {
      List<String> path = [];
      for (Station s in visited.toList()) {
        path.add(s.name);
      }
      Map<String, dynamic> newEntriesValue = {"path": path};
      newEntriesValue.addEntries(totalCost.entries);
      success.add(newEntriesValue);

      return;
    }

    List<Adjacency> filteredAdj =
        _adjacencyContainer.where((adj) => adj.stationId == cur.id).toList();

    for (Adjacency adj in filteredAdj) {
      Station? adjStation = _stationContainer
          .firstWhereOrNull((element) => element.id == adj.adjacencyId);

      if (adjStation == null ||
          visited.any((element) => element.id == adjStation.id)) continue;

      traverse(
          cur: adjStation,
          dest: dest,
          firstStationInLine: firstStationInLine,
          success: success,
          visited: visited,
          totalCost: totalCost);

      // firstStationInLine = cacheStation;
      visited.remove(adjStation);
    }
  }

  // static void _traverse(
  //     {required Station cur,
  //     required Station dest,
  //     required Map<String, dynamic> success,
  //     List<Station>? visited,
  //     Map<String, dynamic>? totalCost,
  //     Station? firstStationInLine}) {
  //   firstStationInLine ??= cur;
  //   totalCost ??= {"price": 0, "duration": 0};
  //   visited ??= [];
  //   visited.add(cur);

  //   // terminate recursion
  //   if (cur.id == dest.id) {
  //     List<String> path = [];
  //     for (Station s in visited.toList()) {
  //       path.add(s.name);
  //     }
  //     Map<String, dynamic> newEntriesValue = {"path": path};
  //     newEntriesValue.addEntries(totalCost.entries);
  //     success["${success.length + 1}"] = newEntriesValue;

  //     return;
  //   }

  //   List<Adjacency> filteredAdj =
  //       _adjacencyContainer.where((adj) => adj.stationId == cur.id).toList();

  //   for (Adjacency adj in filteredAdj) {
  //     Station? adjStation = _stationContainer
  //         .firstWhereOrNull((element) => element.id == adj.adjacencyId);

  //     if (adjStation == null ||
  //         visited.any((element) => element.id == adjStation.id)) continue;

  //     traverse(
  //         cur: adjStation,
  //         dest: dest,
  //         firstStationInLine: firstStationInLine,
  //         success: success,
  //         visited: visited,
  //         totalCost: totalCost);

  //     // firstStationInLine = cacheStation;
  //     visited.remove(adjStation);
  //   }
  // }
}
