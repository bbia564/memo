import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../res/colors.dart';
import '../../../res/style.dart';
import 'add_person_widget.dart';
import 'check_item.dart';
import 'controller.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD"),
        actions: [
          TextButton(
              onPressed: () {
                controller.submit();
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 16.sp, color: const Color(0xFF10AA69)),
              ))
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
                              InkWell(
                                onTap: () {
                                  controller.timeSub();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Image.asset(
                                    "assets/images/ic_sub.png",
                                    width: 20,
                                  ),
                                ),
                              ),
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
                              InkWell(
                                onTap: () {
                                  controller.timeAdd();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Image.asset(
                                    "assets/images/ic_add.png",
                                    width: 20,
                                  ),
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
                        Obx(() => Wrap(
                              spacing: 15.w,
                              runSpacing: 10,
                              children: [
                                ...controller.colors.map((v) => InkWell(
                                      onTap: () {
                                        controller.color.value = v;
                                      },
                                      child: CheckItem(
                                        color: AppColors.colorsUtil(v),
                                        isCheck: controller.color.value == v,
                                      ),
                                    ))
                              ],
                            )),
                      ]),
                )),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
              ),
              child: Text(
                "Attendees：",
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: AddPersonWidget(
                textList: (List<TextEditingController> value) {
                  controller.inputTextControllers = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
