import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../db/db_service.dart';
import '../home/home_logic.dart';

class OtherController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAppInfo();
  }

  Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    // String appName = info.appName;
    // String packageName = info.packageName;
    version.value = info.version;
    // String buildNumber = info.buildNumber;
  }

  final db = Get.find<DatabaseService>();

  onAbout() async {
    var info = await PackageInfo.fromPlatform();
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("About"),
          ),
          body: Column(
            children: [
              20.verticalSpace,
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.asset(
                    "assets/images/am.png",
                    width: 70,
                  )),
              10.verticalSpace,
              Text(info.appName),
              5.verticalSpace,
              Text("v ${info.version}"),
              const Expanded(
                child: Markdown(
                  data: """
SpeechMaster Pro: Your Comprehensive Speech Management Application
SpeechMaster Pro is a specialized application designed for speakers, conference organizers, and event planners, offering a complete solution for managing all aspects of speeches and events. Whether you're preparing for a critical speech that requires meticulous attention to detail or overseeing numerous speaking segments at a major conference, SpeechMaster Pro stands as your capable companion.

Key Features:
Precise Timing: Integrated with a high-precision timer, ensuring your speeches adhere rigorously to prearranged durations. Empower yourself to command the tempo confidently in any scenario.
Professional Design: Tailored specifically for the demands of professional speaking engagements and conference management, catering to the needs of seasoned speakers and event coordinators alike.
User-Friendly Interface: Boasting an intuitive UI, SpeechMaster Pro is accessible even to first-time users, allowing you to concentrate on the essence of your speech rather than getting bogged down in technical complexities.
Choose SpeechMaster Pro: Your Partner in Perfecting Every Speech
SpeechMaster Pro is more than just an application—it's your ally in the pursuit of excellence in speech delivery and event orchestration. With its precision timing capabilities, professional-grade features, and user-friendly design, you're equipped to navigate the intricacies of speech preparation and conference management with ease. Whether you're a seasoned speaker or an event organizer looking to streamline processes, SpeechMaster Pro offers the support you need to succeed..
          """,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(
            data: """
#### Data Collection
Our app does not collect any personal information or user data. All triangle calculations are performed locally on the device and are not transmitted to any external servers.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """,
          ),
        );
      },
    );
  }

  onCleanData() async {
    Get.dialog(AlertDialog(
      title: const Text('Delete'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)), // 设置圆角
      ),
      content: const Text('Are you sure you want to delete all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await db.clean();
            Get.back();
            try {
              TTHomeLogic.to.clean();
            } catch (e) {}
          },
          child: const Text('Confirm'),
        ),
      ],
    ));
  }
}
