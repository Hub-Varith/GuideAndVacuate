import 'dart:math';

class Device {

  // construct random initial position in room
  double x, y;
  Device(){
    var rng = new Random();
    this.x = (rng.nextDouble() * 300);
    this.y = (rng.nextDouble() * 300);
  }

}