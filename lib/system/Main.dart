import 'dart:io';
import 'dart:convert';
import 'package:dart_ex/PathSolution.dart';
class System {
  
  static void importTransition() {
    String data = await File("./db/station/Transition.json").readAsString();
    = json.decode(data);
  }

  static void run() {
    System.importTransition();
  }
}