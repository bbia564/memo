import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:speech_memo/entity/speech_bean.dart';
import 'package:speech_memo/pages/home/widgets/tip_dialog.dart';

import '../../../db/db_service.dart';
import '../../../route/route_config.dart';
import '../home_logic.dart';

class DetailsController extends GetxController {
  final db = Get.find<DatabaseService>();
  TextEditingController nameTC = TextEditingController();
  TextEditingController timeTC = TextEditingController(text: "0");
  List<TextEditingController> inputTextControllers = [];
  var color = 'F16554'.obs;
  List<String> colors = ['F16554', '43C472', 'F59733', 'FCCC44', '4FAAF1', '007AFC', '69A92B'];
  late SpeechBean bean;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() {
    bean = Get.arguments["bean"];
    debugPrint( bean.color);
    color.value = bean.color;
    nameTC.text = bean.name;
    timeTC.text = "${bean.time}";
  }

  delete() async {
    Get.dialog(const TipDialog(title: "Are you sure you want to delete?")).then((v) async {
      if (v == true) {
        EasyLoading.show();
        await db.delete(bean.id);
        TTHomeLogic.to.refreshList();
        Future.delayed(const Duration(seconds: 1)).then((v) {
          EasyLoading.dismiss();
          Get.back();
        });
      }
    });
  }
  toSpeech(){
    Get.toNamed(AppRoute.speech, arguments: {"bean": bean});
  }
}
