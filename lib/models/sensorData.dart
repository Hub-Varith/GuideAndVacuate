import 'dart:convert';

class SensorData {
  int infared;
  int gas;
  int monoxide;
  int temperature;


  SensorData({
    this.infared,
    this.gas,
    this.monoxide,
    this.temperature
  });

  SensorData.fromJson(Map<dynamic, dynamic> d) {
    
    d = jsonDecode(jsonEncode(d));
    this.infared = d['Infared'].toInt() ?? null;
    this.gas = d['Gas'].toInt() ?? null;
    this.monoxide = d['Monoxide'].toInt() ?? null;
    this.temperature = d['Temperature'].toInt() ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infared'] = this.infared;
    data['gas'] = this.gas;
    data['monoxide'] = this.monoxide;
    data['temperature'] = this.temperature;
    return data;
  }
}