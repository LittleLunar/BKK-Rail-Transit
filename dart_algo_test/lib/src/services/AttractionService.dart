import "package:collection/collection.dart";
import 'package:dart_algo/src/services/DBService.dart';
import 'package:dart_algo/src/models/schema/Attraction.dart';

class AttractionService {
  static final List<dynamic> _attractionCollection =
      DBService.getAttractionCollection;

  static List<Attraction> getAttractions() {
    return _parseList(_attractionCollection);
  }

  static Attraction getAttractionByName({required String name}) {
    return _parse(
        _attractionCollection.firstWhereOrNull((element) => element["NAME"] == name));
  }

  static List<Attraction> getAttractionByStationId({required String id}) {
    return _parseList(
        _attractionCollection.where((element) => element["STATION_ID"] == id));
  }

  static Attraction _parse(Map<String, dynamic> json) {
    return Attraction.fromJson(json);
  }

  static List<Attraction> _parseList(Iterable<dynamic> jsonArray) {
    return jsonArray.map((json) => Attraction.fromJson(json)).toList();
  }
}
