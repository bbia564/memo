import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_memo/res/colors.dart';

import '../../../entity/speech_bean.dart';
import '../../../res/style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.speechBean});

  final SpeechBean speechBean;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.defDecoration,
      padding: REdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Column(
        children: [
          13.verticalSpace,
          Row(
            children: [
              Image.asset(
                "assets/images/ic_speech.png",
                width: 23.w,
                height: 23.w,
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(speechBean.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.colorsUtil(speechBean.color))),
              ),
              const Icon(Icons.arrow_forward_ios, color: Color(0xFFA8A8A8), size: 14),
            ],
          ),
          13.verticalSpace,
          const Divider(
            height: 1,
          ),
          15.verticalSpace,
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 46),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Attendees：",
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xFF6E6E6E))),
                Expanded(
                    child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    ...speechBean.speeches.map((v) => _warpItem(v.name)),
                  ],
                ))
              ],
            ),
          ),
          18.verticalSpace,
          const Divider(
            height: 1,
          ),
          14.verticalSpace,
          Row(
            children: [
              Text(
                "Longest Speech Duration：",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xFF6E6E6E),
                ),
              ),
              Expanded(
                child: Text(
                  "${speechBean.time} minutes",
                  style: TextStyle(
                      fontSize: 14.sp, color: AppColors.textB22, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _warpItem(String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r),
          color: AppColors.colorsUtil(speechBean.color).withOpacity(0.14)),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.colorsUtil(speechBean.color),
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
