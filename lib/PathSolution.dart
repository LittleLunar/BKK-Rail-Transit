import 'package:dart_ex/Station.dart';

class PathSolution {
  static Map<List, int> possiblePath(Station source, Station destination) {
    Map<List, int> success = {};
    pathRecursion(source, destination, success);

    return success;
  }

  static void pathRecursion(
      Station cur, Station destination, Map<List, int> success,
      {Set<Station>? visited, int totalcost = 0}) {
    visited ??= {};
    visited.add(cur);

    if (cur.getAdjacency.containsKey(destination)) {
      List<String> path = [];
      for (Station station in visited) {
        path.add(station.name);
      }

      path.add(destination.name);
      success[path] = totalcost + (cur.getAdjacency[destination] as int);
      // print(success);
      return;
    }

    for (Station station in cur.getAdjacency.keys) {
      // print("Passing Through");
      Set<Station> t = visited.toSet();
      t.add(station);

      if (t.difference(visited).isNotEmpty) {
        // print("Not Visited");

        totalcost += cur.getAdjacency[station] as int;

        pathRecursion(station, destination, success,
            visited: visited, totalcost: totalcost);

        visited.remove(station);
      }
    }
  }
}
