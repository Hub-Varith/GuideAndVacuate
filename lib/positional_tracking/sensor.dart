class Sensor {
  int infared;
  int gas;
  int monoxide;
  int temperature;

  double x, y, r;
  
  Sensor(double _x, double _y){
    this.x = _x;
    this.y = _y;
  }

  void updateValues(int _infared, int _gas, int _monoxide, int _temperature){
    this.infared = _infared;
    this.gas = _gas;
    this.monoxide = _monoxide;
    this.temperature = _temperature;
  }

  void setRadius(double _r){
    this.r = _r;
  }
}