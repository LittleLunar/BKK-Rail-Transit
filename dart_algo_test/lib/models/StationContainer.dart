import "package:dart_ex/models/Station.dart";

class StationContainer {
  Map<String, Station>? _stations;

  // Singleton Object {{{-------------------------------------------------------------------------------
  // usage: StationContainer foo = StationContainer();
  static final StationContainer _instance = StationContainer._();

  StationContainer._();

  factory StationContainer() {
    return _instance;
  }

  // }}}-------------------------------------------------------------------------------------------------

  Map<String, Station> get stations {
    return _stations!;
  }

  set stations(Map<String, Station> stations) {
    _stations = stations;
  }
}
