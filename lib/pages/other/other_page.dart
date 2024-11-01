import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_memo/res/style.dart';
import 'controller.dart';

class OtherPage extends GetView<OtherController> {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 20),
          child: SizedBox(
            height: 40,
            child: Text(
              "Other",
              textAlign: TextAlign.center,
              style: AppStyle.titleStyles,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          decoration: AppStyle.defDecoration,
          child: Column(
            children: [
              const Divider(indent:16,endIndent:20,height: 1,),
              ListTile(
                title: Text("About",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF0F0F0F),
                        fontWeight: FontWeight.w400)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFFAAAAAA), size: 14),
                onTap: () {
                  controller.onAbout();
                },
              ),
              const Divider(indent:16,endIndent:20,height: 1,),
              ListTile(
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Version',
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF0F0F0F),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Obx(() => Text(
                          "V${controller.version.value}",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFFADADAD),
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
