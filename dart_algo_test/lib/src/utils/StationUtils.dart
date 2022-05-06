import "package:collection/collection.dart";
import 'package:dart_algo/src/models/schema/Station.dart';
import 'package:dart_algo/src/models/schema/Adjacency.dart';
import 'package:dart_algo/src/models/schema/Cost.dart';

import 'package:dart_algo/src/services/StationService.dart';
import 'package:dart_algo/src/services/AdjacencyService.dart';
import 'package:dart_algo/src/services/CostService.dart';

class StationUtils {
  static final List<Station> _stationContainer = StationService.getStations();
  static final List<Adjacency> _adjacencyContainer =
      AdjacencyService.getAdjacencies();
  static final List<Cost> _costContainer = CostService.getCosts();

  static bool isTransition({required Station s1, required Station s2}) {
    if (s1.lineNumber != s2.lineNumber) return false;

    return true;
  }

  static bool isAdjacency({required Station s1, required Station s2}) {
    return _adjacencyContainer.firstWhereOrNull(
                (obj) => obj.stationId == s1.id && obj.adjacencyId == s2.id) !=
            null
        ? true
        : false;
  }
}
