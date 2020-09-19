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

  SensorData.fromJson(Map<String, dynamic> json) {
    infared = json['infared'];
    gas = json['gas'];
    monoxide = json['monoxide'];
    temperature = json['temperature'];
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