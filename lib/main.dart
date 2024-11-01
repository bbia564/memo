
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_memo/pages/four/budget_four_binding.dart';
import 'package:speech_memo/pages/four/budget_four_view.dart';
import 'package:speech_memo/pages/home/create/controller.dart';
import 'package:speech_memo/pages/home/create/create_page.dart';
import 'package:speech_memo/pages/home/details/details_controller.dart';
import 'package:speech_memo/pages/home/details/details_page.dart';
import 'package:speech_memo/pages/home/home_logic.dart';
import 'package:speech_memo/pages/home/speech/controller.dart';
import 'package:speech_memo/pages/home/speech/speech_page.dart';
import 'package:speech_memo/pages/index_tab_page.dart';
import 'package:speech_memo/pages/other/controller.dart';
import 'package:speech_memo/res/style.dart';



import 'db/db_service.dart';
import 'entity/ppaok.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DatabaseService().init());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Lisa,
      builder: (context, child) {
        
        return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: Scaffold(
              // Global GestureDetector that will dismiss the keyboard
              resizeToAvoidBottomInset: false,
              body: KeyboardDismissOnTap(
                child: FlutterEasyLoading(
                  child: child,
                ),
              ),
            ));
      },
      theme: AppStyle.lightTheme,
      // themeMode: ThemeMode.light,
      defaultTransition: Transition.cupertino,
    );
  }
}
List<GetPage<dynamic>> Lisa = [
  GetPage(
      name: '/',
      page: () => const BudgetFourView(),
      binding: BudgetFourBinding()
  ),
  GetPage(
      name: '/home',
      page: () => const IndexTabPage(),
      binding: BindingsBuilder(
            () {
          Get.put<TTHomeLogic>(TTHomeLogic());
          Get.put<OtherController>(OtherController());
        },
      )),
  GetPage(
      name: '/paas',
      page: () => const DbRewrite(),
     ),
  GetPage(
      name: '/ccc',
      page: () => const CreatePage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<CreateController>(() => CreateController());
        },
      )),
  GetPage(
      name: '/dddd',
      page: () => const DetailsPagePage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<DetailsController>(() => DetailsController());
        },
      )),
  GetPage(
      name: '/speech',
      page: () => const SpeechPage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<SpeechController>(() => SpeechController());
        },
      )),
];