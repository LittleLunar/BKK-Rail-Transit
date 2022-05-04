import 'package:dart_algo/src/services/DBService.dart';

class GateService {
  static final List<dynamic> _gateCollection =
      DBService.getGateCollection;

  static List<dynamic> getGates() {
    return _gateCollection;
  }

  static List<dynamic> getGateByStationId({required String id}) {
    return _gateCollection
        .where((element) => element["STATION_ID"] == id)
        .toList();
  }
  
}
