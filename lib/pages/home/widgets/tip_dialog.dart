import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TipDialog extends StatelessWidget {
  const TipDialog({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only( left: 16, right: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14.sp, color: const Color(0xFF242424), fontWeight: FontWeight.w700),
              ),
            ),
            subtitle == null
                ? const SizedBox()
                : Text(
                    subtitle!,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF242424),
                        fontWeight: FontWeight.w700),
                  ),
            const Divider(
              height: 1,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back(result: true);
                    },
                    child: Text("Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF242424),
                          fontSize: 14.sp,
                        )),
                  ),
                ),
                const SizedBox(height: 30,child: VerticalDivider(),),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back(result: true);
                    },
                    child: Text("Confirm",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF242424),
                          fontSize: 14.sp,
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
