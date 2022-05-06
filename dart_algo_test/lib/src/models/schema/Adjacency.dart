class Adjacency {
  String stationId;
  String adjacencyId;

  Adjacency({required this.stationId, required this.adjacencyId});

  Adjacency.fromJson(Map<String, dynamic> json)
      : stationId = json["STATION_ID"],
        adjacencyId = json["ADJACENCY_ID"];

  Map<String, dynamic> toJson() =>
      {"STATION_ID": stationId, "ADJACENCY_ID": adjacencyId};

  @override
  String toString() {
    return "StationId: $stationId <=> AdjacencyId: $adjacencyId";
  }
}
