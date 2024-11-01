import 'package:speech_memo/entity/speaker.dart';

class SpeechBean {
  int id;
  String name;
  String color;
  int time;
  List<Speaker> speeches;
  String createdAt;

  SpeechBean(
    this.id,
    this.name,
    this.color,
    this.time,
    this.speeches,
    this.createdAt,
  );

  factory SpeechBean.fromJson(Map<String, dynamic> json) {
    List<Speaker> sss = [];
    if (json['persons'] != null) {
      if (json['persons'].toString().contains(",")) {
        var list = json['persons'].toString().split(",");
        for (var v in list) {
          sss.add(Speaker(v, 0));
        }
      } else {
        sss.add(Speaker(json['persons'], 0));
      }
    }
    return SpeechBean(
        json['id'], json['name'], json['color'], json['time'], sss, json['created_at']);
  }
}
