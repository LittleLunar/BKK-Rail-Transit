// import 'dart:collection';

// import 'package:collection/collection.dart';
import 'dart:collection';

import '../../models/schema/Adjacency.dart';
import '../../models/schema/Station.dart';
import '../../services/AdjacencyService.dart';
import '../../services/StationService.dart';

class BFS {
  static void traverse(
      {required Station cur,
      required Station dest,
      required List<dynamic> success,
      Map<String, dynamic>? totalCost,
      Station? firstStationInLine}) {
    firstStationInLine ??= cur;
    totalCost ??= {"price": 0, "duration": 0};

    List<Station> visited = [cur];

    Queue<Station> queue = Queue<Station>();

    queue.addLast(cur);

    while (queue.isNotEmpty) {
      Station s = queue.removeFirst();

      List<Adjacency> filteredAdj =
          AdjacencyService.getAdjacencyByStationId(id: s.id);

      for (Adjacency adj in filteredAdj) {
        Station adjStation = StationService.getStationById(id: adj.adjacencyId);

        if (adjStation.id == dest.id) {
          visited.add(adjStation);
          Map<String, dynamic> newEntriesValue = {"path": visited.toList()};
          newEntriesValue.addEntries(totalCost.entries);
          success.add(newEntriesValue);
          break;
        }

        if (visited.any((element) => element.id == adjStation.id)) continue;

        visited.add(adjStation);
        queue.addLast(adjStation);
      }

      if (success.isNotEmpty) break;
    }
  }
}
