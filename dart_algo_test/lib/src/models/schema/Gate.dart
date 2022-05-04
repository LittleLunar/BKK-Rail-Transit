class Gate {
  String stationId;
  String gateNum;
  String detail;

  Gate({required this.stationId, required this.gateNum, required this.detail});

  Gate.fromJson(Map<String, dynamic> json)
      : stationId = json["STATION_ID"],
        gateNum = json["GATE_NUM"],
        detail = json["DETAIL"];

  Map<String, dynamic> toJson() =>
      {"STATION_ID": stationId, "GATE_NUM": gateNum, "DETAIL": detail};
}
