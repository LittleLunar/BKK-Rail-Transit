import 'package:dart_algo/src/services/DBService.dart';
import 'package:dart_algo/src/models/schema/Adjacency.dart';

class AdjacencyService {
  static final List<dynamic> _adjacencyCollection =
      DBService.getAdjacencyCollection;

  static List<Adjacency> getAdjacencies() {
    return _parseList(_adjacencyCollection);
  }

  static List<Adjacency> getAdjacencyByStationId({required String id}) {
    return _parseList(
        _adjacencyCollection.where((element) => element["STATION_ID"] == id));
  }

  

  static List<Adjacency> _parseList(Iterable<dynamic> jsonArray) {
    return jsonArray.map((json) => Adjacency.fromJson(json)).toList();
  }
}
