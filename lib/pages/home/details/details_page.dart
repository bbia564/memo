import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_memo/pages/home/details/details_controller.dart';

import '../../../res/colors.dart';
import '../../../res/style.dart';
import '../create/check_item.dart';

class DetailsPagePage extends GetView<DetailsController> {
  const DetailsPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAILS"),
        actions: [
          IconButton(
            onPressed: () {
              controller.delete();
            },
            icon: Image.asset(
              "assets/images/ic_del.jpg",
              width: 20,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: AppStyle.defDecoration,
                margin: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
                padding: REdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF535353), fontWeight: FontWeight.w400),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Topic",
                        ),
                        10.verticalSpace,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xFFCBCBCB))),
                          child: TextField(
                            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF535353)),
                            controller: controller.nameTC,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                hintStyle:
                                    TextStyle(fontSize: 14.sp, color: const Color(0xFFB9B9B9))),
                          ),
                        ),
                        16.verticalSpace,
                        const Text(
                          "Longest Speech Duration (in minutes)",
                        ),
                        10.verticalSpace,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: const Color(0xFFCBCBCB))),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(fontSize: 14.sp, color: const Color(0xFF535353)),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: controller.timeTC,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                  ],
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                      hintStyle: TextStyle(
                                          fontSize: 14.sp, color: const Color(0xFFB9B9B9))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.verticalSpace,
                        const Text(
                          "Choose Color",
                        ),
                        12.verticalSpace,
                        Wrap(
                          spacing: 15.w,
                          runSpacing: 10,
                          children: [
                            ...controller.colors.map((v) => CheckItem(
                              color: AppColors.colorsUtil(v),
                              isCheck: controller.color.value == v,
                            ))
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 23, bottom: 5),
                            child: SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.toSpeech();
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    AppColors.themeColor,
                                    // 设置边框颜色和宽度
                                  ),
                                  shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    // 设置边框颜色和宽度
                                  ),
                                ),
                                child: Text(
                                  "Start the speech",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ))
                      ]),
                )),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Attendees：",
              ),
            ),
            Container(
              decoration: AppStyle.defDecoration,
              margin: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  var text = controller.bean.speeches[index];
                  return SizedBox(
                    height: 42,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        text.name,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFF535353),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 1,
                  );
                },
                itemCount: controller.bean.speeches.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
