import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:speech_memo/entity/speaker.dart';
import 'package:speech_memo/entity/speech_bean.dart';

import '../../../db/db_service.dart';
import 'count_timer/controller.dart';

class SpeechController extends GetxController {
  final db = Get.find<DatabaseService>();
  TextEditingController nameTC = TextEditingController();
  TextEditingController timeTC = TextEditingController(text: "0");
  late CountdownController countdownController;
  late SpeechBean bean ;
  var currentSpeaker = Speaker("", 0).obs;
  var speechStatus = 0.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() {
    SpeechBean ff = Get.arguments["bean"];
    bean = SpeechBean(ff.id, ff.name, ff.color, ff.time, ff.speeches, ff.createdAt);
    currentSpeaker.value = bean.speeches.first;
    nameTC.text = bean.name;
    timeTC.text = "${bean.time}";
    countdownController = CountdownController(initialSeconds: bean.time * 60);
    countdownController.addListener(() {
      var listCC = bean.speeches.firstWhere((v) => v.name == currentSpeaker.value.name);
      listCC.time += 1;
      update(["Attend"]);
    });
  }

  startSpeech() {
    speechStatus.value = 1;
    countdownController.resume();
  }

  pauseSpeech() {
    speechStatus.value = 0;
    countdownController.pause();
  }

  endSpeech() {
    countdownController.dispose();
    Get.back();
  }

  void switchSpeaker(Speaker p) {
    pauseSpeech();
    currentSpeaker.value = p;
  }
}
