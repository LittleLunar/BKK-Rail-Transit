import 'dart:io';
import "dart:convert";

class DBService {
  static List<dynamic>? _stationCollection;
  // static List<dynamic>? _attractionCollection;
  static List<dynamic>? _gateCollection;
  static List<dynamic>? _adjacencyCollection;
  static List<dynamic>? _costCollection;

  static final DBService instance = DBService._singleton();

  factory DBService() {
    return instance;
  }

  DBService._singleton() {
    // Connecting to database
    print("Connecting with Database");

    // get the collections of database
    _stationCollection =
        jsonDecode(File(DBJsonFile.jsonStation).readAsStringSync());

    // _attractionCollection =
    //     jsonDecode(File(DBJsonFile.jsonAttraction).readAsStringSync());

    _gateCollection = jsonDecode(File(DBJsonFile.jsonGate).readAsStringSync());

    _adjacencyCollection =
        jsonDecode(File(DBJsonFile.jsonAdjacency).readAsStringSync());

    _costCollection = jsonDecode(File(DBJsonFile.jsonCost).readAsStringSync());
  }

  static List<dynamic> get getStationCollection {
    return _stationCollection!;
  }

  // static List<dynamic> get getAttractionCollection {
  //   return _attractionCollection!;
  // }

  static List<dynamic> get getGateCollection {
    return _gateCollection!;
  }

  static List<dynamic> get getAdjacencyCollection {
    return _adjacencyCollection!;
  }

  static List<dynamic> get getCostCollection {
    return _costCollection!;
  }
}

class DBJsonFile {
  static final jsonStation = "./lib/db/collections/Station.json";
  // static final jsonAttraction = "./lib/db/collections/Attraction.json";
  static final jsonGate = "./lib/db/collections/Gate.json";
  static final jsonAdjacency = "./lib/db/collections/Adjacency.json";
  static final jsonCost = "./lib/db/collections/Cost.json";
}
