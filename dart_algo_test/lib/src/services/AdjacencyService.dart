import 'package:dart_algo/src/services/DBService.dart';

class AdjacencyService {
  static final List<dynamic> _adjacencyCollection = DBService.getAdjacencyCollection;

  static List<dynamic> getAdjacencies() {
    return _adjacencyCollection;
  }

  static List<dynamic> getAdjacencyByStationId({required String id}) {
    return _adjacencyCollection
        .where((element) => element["STATION_ID"] == id)
        .toList();
  }
}
