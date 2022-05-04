import 'dart:io';
import 'dart:convert';
import "package:dart_algo/src/services/DBService.dart";
import "package:dart_algo/src/services/StationService.dart";
import "package:dart_algo/src/services/AttractionService.dart";
import "package:dart_algo/src/services/GateService.dart";
import "package:dart_algo/src/services/AdjacencyService.dart";
import "package:dart_algo/src/services/CostService.dart";

class System {
  
  static void dbConnect() {
    DBService();
  }

  static void run() {
    dbConnect();

    print(StationService.getStations());
    print(AttractionService.getAttractions());
    print(GateService.getGates());
    print(AdjacencyService.getAdjacencies());
    print(CostService.getCosts());
  }
}
