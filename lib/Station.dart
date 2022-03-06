import 'dart:io';
import 'dart:convert';

/*
{
  "a":20,
  "b":30
}
*/
class Station {
  String name;
  final Map<Station, int> _adjacency = {};

  Station({required this.name});

  void addAdjacent(Station adjacent, int cost, {bool reverseAdd = true}) {
    _adjacency[adjacent] = cost;

    if (reverseAdd) {
      adjacent.addAdjacent(this, cost, reverseAdd: false);
    }
  }

  Map<Station, int> get getAdjacency {
    return _adjacency;
  }

  void printAdjacency() {
    String str = "$name :";
    for (Station station in _adjacency.keys) {
      str += " " + station.name;
    }
    print(str);
  }

  String get getName {
    return name;
  }

  // Load Station From JSON
  static Future<List<Station>> stationLoaderFromJSON(String path) async {
    String data = await File("./db/BTS.json").readAsString();
    Map<String, dynamic> decoded = json.decode(data);
    List<Station> returner = [];

    for (var name in decoded["station"].keys) {
      returner.add(Station(name: name));
    }

    for (Station station in returner) {
      List<Station> adjacencies = returner
          .where((station) => decoded["station"][station.name]["adjacency"]
              .contains(station.name))
          .toList();

      for (Station adjacency in adjacencies) {
        station.addAdjacent(adjacency, -1);
      }
    }

    return returner;
  }
}
