import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:speech_memo/pages/home/details/details_controller.dart';
import 'package:speech_memo/pages/home/details/details_page.dart';
import 'package:speech_memo/pages/home/speech/controller.dart';
import 'package:speech_memo/pages/home/speech/speech_page.dart';
import '../pages/home/create/controller.dart';
import '../pages/home/create/create_page.dart';
import '../pages/home/home_logic.dart';
import '../pages/index_tab_page.dart';
import '../pages/other/controller.dart';

class AppRoute {
  static const home = "/home";
  static const ccc = "/ccc";
  static const ddd = "/dddd";
  static const speech = "/speech";

  static List<Route<dynamic>> routeRecord = List.empty(growable: true);

  static final List<GetPage> pages = [
    GetPage(
        name: home,
        page: () => const IndexTabPage(),
        binding: BindingsBuilder(
          () {
            Get.put<TTHomeLogic>(TTHomeLogic());
            Get.put<OtherController>(OtherController());
          },
        )),
    GetPage(
        name: ccc,
        page: () => const CreatePage(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut<CreateController>(() => CreateController());
          },
        )),
    GetPage(
        name: ddd,
        page: () => const DetailsPagePage(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut<DetailsController>(() => DetailsController());
          },
        )),
    GetPage(
        name: speech,
        page: () => const SpeechPage(),
        binding: BindingsBuilder(
          () {
            Get.lazyPut<SpeechController>(() => SpeechController());
          },
        )),
  ];
}
