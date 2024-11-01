import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:speech_memo/pages/home/widgets/itme.dart';
import 'package:speech_memo/res/colors.dart';
import 'package:speech_memo/res/style.dart';

import '../../widgets/empty_widget.dart';
import 'home_logic.dart';

class HomePage extends GetView<TTHomeLogic> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: context.mediaQueryPadding.top + 20,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  "Speech Duration Record",
                  textAlign: TextAlign.center,
                  style: AppStyle.titleStyles,
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        controller.toADD();
                      },
                      icon: Image.asset(
                        "assets/images/ic_home_top_add.png",
                        width: 20,
                      )),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Obx(() => _buildListView()))
      ],
    );
  }

  Widget _buildListView() {
    if (controller.allLists.isEmpty) {
      return const EmptyWidget(
        text: "No speeches added yet",
      );
    }
    return ListView.separated(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 18),
      itemCount: controller.allLists.length,
      itemBuilder: (context, index) {
        final bean = controller.allLists[index];
        return InkWell(
            onTap: () {
              controller.toDetails(bean);
            },
            child: HomeItem(
              speechBean: bean,
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return 16.verticalSpace;
      },
    );
  }
}
