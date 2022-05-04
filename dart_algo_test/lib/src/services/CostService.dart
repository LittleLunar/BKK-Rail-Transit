import 'package:dart_algo/src/services/DBService.dart';

class CostService {
  static final List<dynamic> _costCollection = DBService.getCostCollection;

  static List<dynamic> getCosts() {
    return _costCollection;
  }

  static List<dynamic> getCostBySrcDest(
      {required String srcId, required String destId}) {
    return _costCollection.firstWhere((element) =>
        element["STATION_ID_SRC"] == srcId &&
        element["STATION_ID_DEST"] == destId);
  }

  static List<dynamic> getCostByStationId({required String id}) {
    return _costCollection
        .where((element) => element["STATION_ID_SRC"] == id)
        .toList();
  }
}
