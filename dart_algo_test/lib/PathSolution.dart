import 'dart:io';
import 'dart:convert';
import 'package:dart_ex/models/Station.dart';

class PathSolution {

  static Map<String, dynamic> transition = {};


  static void importTransition() async {
    String data = await File("./db/station/Transition.json").readAsString();
    PathSolution.transition = json.decode(data);
  }

  
}
