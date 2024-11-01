import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../db/db_service.dart';
import '../home_logic.dart';

class CreateController extends GetxController {
  final db = Get.find<DatabaseService>();
  TextEditingController nameTC = TextEditingController();
  TextEditingController timeTC = TextEditingController(text: "0");
  List<TextEditingController> inputTextControllers = [];
  var color = 'F16554'.obs;
  List<String> colors = ['F16554', '43C472', 'F59733', 'FCCC44', '4FAAF1', '007AFC', '69A92B'];

  submit() async {
    if (nameTC.text.isEmpty) {
      EasyLoading.showToast("Please input the speech topic");
      return;
    }
    if (timeTC.text.isEmpty) {
      EasyLoading.showToast("Please input the speech duration");
      return;
    }
    if (inputTextControllers.isEmpty || inputTextControllers[0].text.isEmpty) {
      EasyLoading.showToast("Please  add attendees");
      return;
    }
    List<String> inputTexts = [];
    for (var v in inputTextControllers) {
      if (v.text.isNotEmpty) {
        inputTexts.add(v.text);
      }
    }
    await db.add(nameTC.text, color.value, int.parse(timeTC.text), inputTexts.join(","));

    TTHomeLogic.to.refreshList();
    Future.delayed(const Duration(seconds: 1)).then((v) {
      EasyLoading.dismiss();
      Get.back();
    });
  }

  timeAdd() {
    if (timeTC.text.isNotEmpty) {
      int aa = int.parse(timeTC.text);
      aa++;
      timeTC.text = "$aa";
    }
  }

  timeSub() {
    if (timeTC.text.isNotEmpty) {
      int aa = int.parse(timeTC.text);
      if (aa > 0) {
        aa--;
        timeTC.text = "$aa";
      }
    }
  }
}
