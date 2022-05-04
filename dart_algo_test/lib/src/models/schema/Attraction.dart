class Attraction {
  String stationId;
  String name;
  String detail;
  int lat;
  int long;

  Attraction(
      {required this.stationId,
      required this.name,
      required this.detail,
      required this.lat,
      required this.long});

  Attraction.fromJson(Map<String, dynamic> json)
      : stationId = json["STATION_ID"],
        name = json["NAME"],
        detail = json["DETAIL"],
        lat = json["LAT"],
        long = json["LONG"];

  Map<String, dynamic> toJson() => {
        "STATION_ID": stationId,
        "NAME": name,
        "DETAIL": detail,
        "LAT": lat,
        "LONG": long
      };
}
