class Cost {
  String stationIdSrc;
  String stationIdDest;
  int price;
  int duration;

  Cost(
      {required this.stationIdSrc,
      required this.stationIdDest,
      required this.price,
      required this.duration});

  Cost.fromJson(Map<String, dynamic> json)
      : stationIdSrc = json["STATION_ID_SRC"],
        stationIdDest = json["STATION_ID_DEST"],
        price = json["PRICE"],
        duration = json["DURATION"];

  Map<String, dynamic> toJson() => {
        "STATION_ID_SRC": stationIdSrc,
        "STATION_ID_DEST": stationIdDest,
        "PRICE": price,
        "DURATION": duration
      };
}
