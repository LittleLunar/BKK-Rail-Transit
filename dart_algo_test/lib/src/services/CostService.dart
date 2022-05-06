import "package:collection/collection.dart";
import 'package:dart_algo/src/services/DBService.dart';
import 'package:dart_algo/src/models/schema/Cost.dart';

class CostService {
  static final List<dynamic> _costCollection = DBService.getCostCollection;

  static List<Cost> getCosts() {
    return _parseList(_costCollection);
  }

  static Cost getCostBySrcDest(
      {required String srcId, required String destId}) {
    return _parse(_costCollection.firstWhereOrNull((element) =>
        element["STATION_ID_SRC"] == srcId &&
        element["STATION_ID_DEST"] == destId));
  }

  static List<Cost> getCostByStationId({required String id}) {
    return _parseList(
        _costCollection.where((element) => element["STATION_ID_SRC"] == id));
  }

  static Cost _parse(Map<String, dynamic> json) {
    return Cost.fromJson(json);
  }

  static List<Cost> _parseList(Iterable<dynamic> jsonArray) {
    return jsonArray.map((json) => Cost.fromJson(json)).toList();
  }
}
