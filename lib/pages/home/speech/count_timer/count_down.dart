import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_memo/res/colors.dart';

import 'controller.dart';

class CountdownTimerWidget extends StatelessWidget {
  final ValueNotifier<CountdownState> controller;
  final ValueChanged<int> countdownValue;

  const CountdownTimerWidget({super.key, required this.controller, required this.countdownValue});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CountdownState>(
      valueListenable: controller,
      builder: (context, value, _) {
        countdownValue.call(value.totalSeconds);
        return Center(
          child: Text(value.format(),
              style: TextStyle(
                  fontSize: 60.sp, color: AppColors.themeColor, fontWeight: FontWeight.bold)),
        );
      },
    );
  }
}
