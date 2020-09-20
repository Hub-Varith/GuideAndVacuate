
import 'dart:typed_data';
import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'package:soundpool/soundpool.dart';
// curl -X POST -u "apikey:ok0PrLlHvubuTFAF_dn3h5N59Dh0n7ANBPDq4qzsmLRp" ^
// --header "Content-Type: application/json" ^
// --header "Accept: audio/wav" ^
// --data "{\"text\":\"hello world\"}" ^
// --output hello_world.wav ^
// "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/0b3a5557-35d3-487c-af07-f7e478da62a4/v1/synthesize"


class TTSService {
  String api_key = "XgbcSR80jUxL3v5GgpaPGeEnBdtB6oiFQC9z_jyPfNke";

  String api_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/50ab5483-e0c1-40be-8e97-887ca0cb77ce";

  Future<bool> getTTS(String text) async{
    IamOptions options = await IamOptions(iamApiKey: api_key, url: api_url).build();
    TextToSpeech service = new TextToSpeech(iamOptions: options);
    service.setVoice("en-US_KevinV3Voice");
    Uint8List bi = await service.toSpeech(text);    
    
    Soundpool pool = Soundpool(streamType: StreamType.music);

    int n = await pool.loadUint8List(bi);
    pool.play(n);
    
  }
}