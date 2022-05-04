class Adjacency {
  String stationId_1;
  String stationId_2;

  Adjacency({required this.stationId_1, required this.stationId_2});

  Adjacency.fromJson(Map<String, dynamic> json)
      : stationId_1 = json["STATION_ID"],
        stationId_2 = json["ADJACENCY_ID"];

  Map<String, dynamic> toJson() =>
      {"STATION_ID": stationId_1, "ADJACENCY_ID": stationId_2};
}
