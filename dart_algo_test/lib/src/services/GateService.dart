import 'package:dart_algo/src/services/DBService.dart';
import 'package:dart_algo/src/models/schema/Gate.dart';

class GateService {
  static final List<dynamic> _gateCollection = DBService.getGateCollection;

  static List<Gate> getGates() {
    return _parseList(_gateCollection);
  }

  static List<Gate> getGateByStationId({required String id}) {
    return _parseList(
        _gateCollection.where((element) => element["STATION_ID"] == id));
  }

  static List<Gate> _parseList(Iterable<dynamic> jsonArray) {
    return jsonArray.map((json) => Gate.fromJson(json)).toList();
  }
}
