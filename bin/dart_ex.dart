import 'package:dart_ex/util/SetImple.dart';
import 'package:dart_ex/Station.dart';
import 'package:dart_ex/PathSolution.dart';

// Depth First Search
void main(List<String> arguments) async {
  Station siam = Station(name: "Siam");
  Station a = Station(name: "A");
  Station b = Station(name: "B");
  Station c = Station(name: "C");
  Station d = Station(name: "D");
  Station e = Station(name: "E");
  Station f = Station(name: "F");
  siam.addAdjacent(a, 100);
  a.addAdjacent(b, 10);
  b.addAdjacent(c, 50);
  b.addAdjacent(e, 20);
  c.addAdjacent(d, 30);
  e.addAdjacent(d, 40);
  f.addAdjacent(e, 20);

  print("Adjacency List :");
  siam.printAdjacency();
  a.printAdjacency();
  b.printAdjacency();
  c.printAdjacency();
  d.printAdjacency();
  e.printAdjacency();
  f.printAdjacency();

  Station source = siam;
  Station destination = f;
  print("\nSource : ${source.name}\nDestination : ${destination.name}");
  Map<List, int> allPath = PathSolution.possiblePath(source, destination);
  print("\nResult : $allPath");

  // Set<String> z = {"A", "B"};
  // Set<String> y = {"A", "B"};
  // print(SetImple.equals(z, y));
}
