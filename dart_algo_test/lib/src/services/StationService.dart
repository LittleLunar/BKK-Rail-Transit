import "package:collection/collection.dart";
import 'package:dart_algo/src/services/DBService.dart';
import 'package:dart_algo/src/models/schema/Station.dart';

class StationService {
  static final List<dynamic> _stationCollection =
      DBService.getStationCollection;

  static List<Station> getStations() {
    return _parseList(_stationCollection);
  }

  static Station getStationById({required String id}) {
    return _parse(
        _stationCollection.firstWhereOrNull((element) => element["ID"] == id));
  }

  static List<Station> getStationByLine({required int lineNumber}) {
    return _parseList(_stationCollection
        .where((element) => element["LINE_NUMBER"] == lineNumber));
  }

  static Station getStationByNameAndLine(
      {required String name, required String lineNumber}) {
    return _parse(_stationCollection.firstWhereOrNull((element) =>
        element["NAME"] == name && element["LINE_NUMBER"] == lineNumber));
  }

  static Station _parse(Map<String, dynamic> json) {
    return Station.fromJson(json);
  }

  static List<Station> _parseList(Iterable<dynamic> jsonArray) {
    return jsonArray.map((json) => Station.fromJson(json)).toList();
  }
}
