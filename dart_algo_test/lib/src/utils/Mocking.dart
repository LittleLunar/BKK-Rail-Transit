import 'dart:io';
import 'dart:convert';

class Mock {
  static void mockAdjacency() {
    final file = File("./lib/db/collections/Adjacency.json");

    List<dynamic> adjacencies = [];
    _doubleAdd(adjacencies, "1", "2");
    _doubleAdd(adjacencies, "2", "3");
    _doubleAdd(adjacencies, "3", "4");
    _doubleAdd(adjacencies, "4", "5");
    _doubleAdd(adjacencies, "5", "6");
    _doubleAdd(adjacencies, "6", "7");
    _doubleAdd(adjacencies, "7", "8");
    _doubleAdd(adjacencies, "8", "24");
    _doubleAdd(adjacencies, "9", "10");
    _doubleAdd(adjacencies, "9", "18");
    _doubleAdd(adjacencies, "10", "11");
    _doubleAdd(adjacencies, "10", "6");
    _doubleAdd(adjacencies, "11", "12");
    _doubleAdd(adjacencies, "12", "13");
    _doubleAdd(adjacencies, "13", "14");
    _doubleAdd(adjacencies, "14", "15");
    _doubleAdd(adjacencies, "15", "16");
    _doubleAdd(adjacencies, "16", "17");
    _doubleAdd(adjacencies, "17", "30");
    _doubleAdd(adjacencies, "18", "19");
    _doubleAdd(adjacencies, "19", "20");
    _doubleAdd(adjacencies, "20", "21");
    _doubleAdd(adjacencies, "21", "22");
    _doubleAdd(adjacencies, "22", "23");
    _doubleAdd(adjacencies, "23", "24");
    _doubleAdd(adjacencies, "24", "25");
    _doubleAdd(adjacencies, "25", "26");
    _doubleAdd(adjacencies, "26", "27");
    _doubleAdd(adjacencies, "27", "28");
    _doubleAdd(adjacencies, "28", "29");
    _doubleAdd(adjacencies, "29", "30");
    file.writeAsStringSync(jsonEncode(adjacencies));
  }

  static void _doubleAdd(List<dynamic> l, String a, String b) {
    l.add({"STATION_ID": a, "ADJACENCY_ID": b});
    l.add({"STATION_ID": b, "ADJACENCY_ID": a});
  }
}
