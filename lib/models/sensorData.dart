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
    print(d);
    this.infared = d['Infared'] ?? null;
    this.gas = d['Gas'] ?? null;
    this.monoxide = d['Monoxide'] ?? null;
    this.temperature = d['Temperature'] ?? null;
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