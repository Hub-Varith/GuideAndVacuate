import 'dart:convert';

class SensorData {
  bool FIRE;
  double LPG;
  double Monoxide;
  int Temperature;
  String day_of_the_week;
  String timehour;
  String timemin;
  String timesec;


  SensorData({
    this.FIRE,
    this.LPG,
    this.Monoxide,
    this.Temperature,
    this.day_of_the_week,
    this.timehour,
    this.timemin,
    this.timesec
  });

  SensorData.fromJson(Map<dynamic, dynamic> d) {
    
    d = jsonDecode(jsonEncode(d));
    this.FIRE = d["FIRE"] == 1 || d["Fire"] == "1" ? true : false;
    this.LPG = d["LPG"].toDouble() ?? null;
    this.Monoxide = d["Monoxide"].toDouble() ?? null;
    this.Temperature = d["Temperature"].toInt() ?? null;
    this.day_of_the_week = d["day_of_the_week"] ?? null;
    this.timehour = d["timehour"] ?? null;
    this.timemin = d["timemin"] ?? null;
    this.timesec = d["timesec"] ?? null;
  }
}