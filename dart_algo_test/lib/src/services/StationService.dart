import 'package:dart_algo/src/services/DBService.dart';

class StationService {
  static final List<dynamic> _stationCollection =
      DBService.getStationCollection;

  static List<dynamic> getStations() {
    return _stationCollection;
  }

  static Map<String, dynamic> getStationById({required String id}) {
    return _stationCollection.firstWhere((element) => element["ID"] == id);
  }

  static List<dynamic> getStationByLine({required int lineNumber}) {
    return _stationCollection
        .where((element) => element["LINE_NUMBER"] == lineNumber)
        .toList();
  }

  static Map<String, dynamic> getStationByNameAndLine(
      {required String name, required String lineNumber}) {
    return _stationCollection.firstWhere((element) =>
        element["NAME"] == name && element["LINE_NUMBER"] == lineNumber);
  }
}
