
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_memo/res/style.dart';
import 'package:speech_memo/route/route_config.dart';



import 'db/db_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DatabaseService().init());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // 设置状态栏文字和图标颜色为亮色（白色）
  ));
  //禁止横屏
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
    ); //支持分屏
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.home,
      getPages: AppRoute.pages,
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
      //页面跳转风格
      defaultTransition: Transition.cupertino,
    );
  }
}
