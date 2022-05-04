import 'package:dart_algo/src/services/DBService.dart';

class AttractionService {
  static final List<dynamic> _attractionCollection =
      DBService.getAttractionCollection;

  static List<dynamic> getAttractions() {
    return _attractionCollection;
  }

  static Map<String, dynamic> getAttractionByName({required String name}) {
    return _attractionCollection
        .firstWhere((element) => element["NAME"] == name);
  }

  static List<dynamic> getAttractionByStationId({required String id}) {
    return _attractionCollection
        .where((element) => element["STATION_ID"] == id)
        .toList();
  }
}
