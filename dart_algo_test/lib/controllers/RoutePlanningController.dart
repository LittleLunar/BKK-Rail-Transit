import 'dart:io';
import 'package:dart_ex/models/Station.dart';

class RoutePlanningController {
  static List<List<String>> possiblePath(Station source, Station destination) {
    List<List<String>> success = [];
    pathRecursion(source, destination, success);

    return success;
  }

  static void pathRecursion(
      Station cur, Station destination, List<List<String>> success,
      {Set<Station>? visited}) {
    visited ??= {};
    visited.add(cur);

    if (cur.getAdjacencies.containsKey(destination)) {
      List<String> path = [];

      for (Station station in visited) {
        path.add(station.name);
      }

      path.add(destination.name);

      success.add(path);

      return;
    }

    for (Station station in cur.getAdjacencies.values) {
      // print("Passing Through");
      Set<Station> t = visited.toSet();
      t.add(station);

      if (t.difference(visited).isNotEmpty) {
        // print("Not Visited");

        pathRecursion(station, destination, success, visited: visited);

        visited.remove(station);
      }
    }
  }
}
