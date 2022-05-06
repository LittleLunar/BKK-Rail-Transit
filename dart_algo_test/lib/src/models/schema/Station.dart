class Station {
  String id;
  String name;
  int lineNumber;
  String detail;
  int lat;
  int long;

  Station(
      {required this.id,
      required this.name,
      required this.lineNumber,
      required this.detail,
      required this.lat,
      required this.long});

  // Load Station From JSON
  Station.fromJson(Map<String, dynamic> json)
      : id = json["ID"],
        name = json["NAME"],
        lineNumber = json["LINE_NUMBER"],
        detail = json["DETAIL"],
        lat = json["LAT"],
        long = json["LONG"];

  Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
        "LINE_NUMBER": lineNumber,
        "DETAIL": detail,
        "LAT": lat,
        "LONG": long
      };

  @override
  String toString() {
    return name;
  }
}
