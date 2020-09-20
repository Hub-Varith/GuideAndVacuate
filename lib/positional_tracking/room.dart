
import 'package:Vacuate/positional_tracking/sensor.dart';

class Room {
  var doorWays = [
    
    [175.0, 0.0, 25.0, 1.0],
    [75.0, 300.0, 20.0, 1.0],
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

  ShallowComparison shallowCheck(quadrant, List<int> prevQuads){
    var potentialDepth = [];
    var copycat = graph[quadrant-1];
    copycat.removeWhere( (a) => prevQuads.contains(a));
    for (int i = 0; i< copycat.length; i++){
      if (copycat[i] < 0){
        // If negative door exists in the list
        return ShallowComparison(length: 1, quadMovement: [copycat[i]]);
      }else{
        prevQuads.add(quadrant);
        ShallowComparison obj = shallowCheck(copycat[i], prevQuads);
        obj.length  += 1;
        obj.quadMovement.add(copycat[i]);
        potentialDepth.add(
          obj
        );
      }
    }
    int shortest = 1000;
    ShallowComparison low;
    for(int i = 0; i < potentialDepth.length; i++){
      if(potentialDepth[i].length < shortest){
        low = potentialDepth[i];
      }
    }
    return low;

  }

  List<dynamic> findPath(List<Sensor> sensors, device){
    // Locate what quadrant you are in
    double lowest = 10000;
    int quadrant = -1;
    for(int i = 0; i < sensors.length; i++){
      if (sensors[i].r < lowest){
        lowest = sensors[i].r;
        quadrant = i+1;
      }
    }
    
    // Round One Options
    ShallowComparison accessRoute = shallowCheck(quadrant, []);
    
    var pointPositions = accessRoute.quadMovement.reversed.toList();
    print(pointPositions);
    List<List<double>> points = [];
    for(int i = 0; i < pointPositions.length; i++){
      if (pointPositions[i] < 0){
        int k = doorWays.length + pointPositions[i];
        points.add(doorWays[k]);
      }else{
        if(quadrant * pointPositions[i] == 8){
          points.add(intermediateDoors[1-1]);
        }else{
          int big;
          if(quadrant > pointPositions[i]){
            big = quadrant;
          }else{
            big = pointPositions[i];
          }
          points.add(intermediateDoors[big-1]);
        }
      }
    }
    print(points);
    return points;
  }
}

class ShallowComparison {
  int length;
  List<int> quadMovement;

  ShallowComparison({this.length, this.quadMovement});
}