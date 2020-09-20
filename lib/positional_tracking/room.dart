import 'package:Vacuate/positional_tracking/sensor.dart';

class Room {
  var doorWays = [
    [75.0, 300.0, 20.0, 1.0],
    [175.0, 0.0, 25.0, 1.0]
  ];

  var intermediateDoors = [
    [200.0, 150.0, 25.0, 1.0],[150.0, 50.0, 1.0, 25.0],
    
    [65.0, 150.0, 20.0, 1.0],[150.0, 200.0, 1.0, 25.0],
    
  ];

  var graph = [
    [-2, 2, 4],
    [1, 3],
    [-1, 2, 4],
    [1,3]


  ];

  bool exitTest(array){
    double prod = 1;
    for(int i = 0; i < array.length; i++){
      prod *= array[i];
    }

    return prod<0;
  }

  List<List<double>> findPath(List<Sensor> sensors, device){
    // Locate what quadrant you are in
    double lowest = 10000;
    int quadrant = -1;
    for(int i = 0; i < sensors.length; i++){
      if (sensors[i].r < lowest){
        lowest = sensors[i].r;
        quadrant = i+1;
      }
    }

    print(quadrant);
    if (exitTest(graph[quadrant-1])){
      // You are in location which is next to exit
      // find the negative number
      var d = -1;
      for(int i =0; i < graph[quadrant-1].length; i++){
        if(graph[quadrant-1][i] < 0){
          d = graph[(quadrant)%doorWays.length][i];
        }
      }
      print("Go to doorway" + doorWays[d % doorWays.length].toString());
      return [doorWays[d % doorWays.length]];
    }else if( exitTest( graph[graph[quadrant+1][0]] )){
      // Which way do we go
      int iDoor = quadrant+1 - (quadrant+1 - graph[quadrant+1][0]);
      var d = -1;
      for(int i =0; i < graph[graph[quadrant+1][0]].length; i++){
        if(graph[quadrant+1][i] < 0){
          d = graph[quadrant+1][i];
        }
      }
      print("Puff");
      return [intermediateDoors[iDoor % intermediateDoors.length], doorWays[d % doorWays.length]];
    }else if(exitTest( graph[graph[quadrant][1]])){
      // Which way do we go
      int iDoor = quadrant+1 - (quadrant+1 - graph[quadrant+1][0]);
      var d = -1;
      for(int i =0; i < graph[graph[quadrant+1][0]].length; i++){
        if(graph[quadrant+1][i] < 0){
          d = graph[quadrant+1][i];
        }
      }
      return [intermediateDoors[iDoor % intermediateDoors.length], doorWays[d % doorWays.length]];
    }else{
      print("Impossible path");
    }

  }
}