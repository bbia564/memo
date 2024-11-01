import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/colors.dart';
import '../../../res/style.dart';
import 'controller.dart';
import 'count_timer/count_down.dart';

class SpeechPage extends GetView<SpeechController> {
  const SpeechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPEECH"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: AppStyle.defDecoration,
                margin: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
                padding: REdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "Topic",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF535353),
                        fontWeight: FontWeight.bold),
                  ),
                  30.verticalSpace,
                  CountdownTimerWidget(
                    controller: controller.countdownController,
                    countdownValue: (int value) {
                      if (value <= 0) {
                        // controller.finishClean();
                      }
                    },
                  ),
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person_pin,
                        color: Color(0xFF9B9B9B),
                      ),
                      Text(
                        "Current Speaker",
                        style: TextStyle(fontSize: 12.sp, color: const Color(0XFF9B9B9B)),
                      ),
                      9.horizontalSpace,
                      Obx(() => Flexible(
                            child: Text(
                              controller.currentSpeaker.value.name,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0XFF535353),
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 23, bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Obx(() => ElevatedButton(
                              onPressed: () {
                                if (controller.speechStatus.value == 0) {
                                  controller.startSpeech();
                                } else {
                                  controller.pauseSpeech();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.themeColor,
                                ),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                controller.speechStatus.value == 0 ? "Start" : "Stop",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )),
                      ))
                ])),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Attendees：",
              ),
            ),
            Container(
              decoration: AppStyle.defDecoration,
              margin: REdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: GetBuilder<SpeechController>(
                  id: "Attend",
                  builder: (_) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var text = controller.bean.speeches[index];
                        return InkWell(
                          onTap: () {
                            controller.switchSpeaker(text);
                          },
                          child: SizedBox(
                            height: 42,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    text.name,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xFF535353),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "${text.time} S",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFF535353),
                                      fontWeight: FontWeight.bold),
                                ),
                                5.horizontalSpace,
                                if (controller.currentSpeaker.value.name == text.name)
                                  const Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: AppColors.themeColor,
                                  ),
                                if (controller.currentSpeaker.value.name != text.name)
                                  const Icon(
                                    Icons.check_circle,
                                    size: 20,
                                    color: Colors.transparent,
                                  ),
                              ],
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
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
