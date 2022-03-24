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
  int lineNumber;
  final Map<String, Station> _adjacencies = {};

  Station({required this.name,required this.lineNumber});

  void addAdjacency(Station? adjacency, {bool reverseAdd = false}) {

    if (adjacency == null) return;

    _adjacencies[adjacency.name] = adjacency;

    if (reverseAdd) {
      adjacency.addAdjacency(this, reverseAdd: false);
    }
  }

  Map<String, Station> get getAdjacencies {
    return _adjacencies;
  }

  void printAdjacencies() {
    String str = "$name :";
    for (Station station in _adjacencies.values) {
      str += " | " + station.name;
    }
    print(str);
  }

  String get getName {
    return name;
  }

  // Load Station From JSON
  
}

class StationBuilder {
  
  static Map<String, Station> getStationDemo() {

    List<Station> station = [];
    for(int i=65; i < 85; i++) {
      int n;
      if (i < 75) n = 1;
      else if (i < 80) n = 2;
      else n = 3;
      station.add(Station(name: String.fromCharCode(i), lineNumber: n));
    }

    for(int i = 0; i < 9; i++) {
      station[i].addAdjacency(station[i + 1], reverseAdd: true);
    }

    for(int i=10; i < 14; i++) {
      station[i].addAdjacency(station[i + 1],reverseAdd: true);
    }

    for(int i = 15; i < 19; i++) {
      station[i].addAdjacency(station[i + 1], reverseAdd: true);
    }

    Map<String, List<String>> transition = { 
      "C" : ["N"],
      "N" : ["C"],
      "R" : ["L"], 
      "L" : ["R"]
    };
    Map<String, Station> returner = {};
    for (Station s in station) {
      s.printAdjacencies();
      returner[s.name] = s;
    }
    
    
    
    return returner;
  }

  static Future<Map<String, Station>> loadFromJSON(String path) async {

    String data = await File(path).readAsString();
    Map<String, dynamic> decoded = json.decode(data);
    final Map<String, Station> returner = {};
    
    for (String stationType in decoded.keys) {

      for (String stationName in decoded[stationType].keys) {
        
        returner[stationName] = Station(name: stationName, lineNumber: decoded[stationType][stationName]["lineNumber"]);
        
        // for (String adjacencyName in decoded[stationType][stationName]["adjacencies"]) {
          
        //   if (!returner.containsKey(adjacencyName)) {
        //     returner[adjacencyName] = Station(name: adjacencyName, lineNumber: decoded[stationType][stationName]["lineNumber"]);
        //   }
        //   returner[stationName]?.addAdjacency(returner[adjacencyName]);

        // }
      }
    }

    for (String stationType in decoded.keys) {

      for (String stationName in decoded[stationType].keys) {
        
        for (String adjacencyName in decoded[stationType][stationName]["adjacencies"]) {

          returner[stationName]?.addAdjacency(returner[adjacencyName]);

        }
        
      }
    }
    
    
    
    // for(Station station in returner.values) {
    //   print(station.getAdjacencies.keys);
    // }
    // print(returner);
    // print(returner["Khu Khot"]?.getAdjacencies["Yaek Kor Por Aor"]);
    // print(returner["Yaek Kor Por Aor"]);

    // if (identical(returner["Khu Khot"]?.getAdjacencies["Yaek Kor Por Aor"], returner["Yaek Kor Por Aor"])) {
    //   print("Same!!!!!!!!!!!!!!!!!!!!!!\n");
    // }
    // for (Station s in returner.values) {
    //   s.printAdjacencies();
    // }
      

    return returner;
  }
}