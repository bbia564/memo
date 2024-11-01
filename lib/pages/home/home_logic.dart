import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../db/db_service.dart';
import '../../entity/speech_bean.dart';

class TTHomeLogic extends GetxController {
  static TTHomeLogic get to => Get.find<TTHomeLogic>();
  final db = Get.find<DatabaseService>();
  TextEditingController modify = TextEditingController();
  var balance = 0.0.obs;
  var allLists = <SpeechBean>[].obs;
  final DateFormat formatterDay = DateFormat('yyyy-MM-dd');
  var today = "".obs;

  @override
  void onInit() {
    today.value = formatterDay.format(DateTime.now());
    init();
    super.onInit();
  }

  init() async {
    allLists.value = await db.getAllSpeeches();
    update();
  }

  refreshList() async {
    init();
  }

  clean() {
    allLists.clear();
    update();
  }

  toDetails(SpeechBean bean) {
    Get.toNamed('/dddd', arguments: {"bean": bean});
  }
  toADD() {
    Get.toNamed('/ccc');
  }
}
