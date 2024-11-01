import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:speech_memo/pages/other/other_page.dart';
import 'package:speech_memo/res/colors.dart';

import '../route/route_config.dart';
import 'home/home_page.dart';

class IndexTabPage extends StatefulWidget {
  const IndexTabPage({super.key});

  @override
  State<IndexTabPage> createState() => _HomePageState();
}

class _HomePageState extends State<IndexTabPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: currentIndex,
        children: const [HomePage(), SizedBox(), OtherPage()],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            backgroundColor: AppColors.themeColor,
            elevation: 0,
            shape: const OvalBorder(),
            onPressed: () {
              Get.toNamed(AppRoute.ccc);
            },
            child: Image.asset(
              "assets/images/ic_bottom_add.png",
              width: 22,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.themeColor,
      unselectedItemColor: AppColors.textB29,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_home.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_home_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          label: '',
          icon: SizedBox(),
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_set.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_set_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Other',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          return;
        }
        Get.focusScope?.unfocus();
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
