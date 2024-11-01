import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPersonWidget extends StatefulWidget {
  const AddPersonWidget({super.key, required this.textList});

  final ValueChanged<List<TextEditingController>> textList;

  @override
  State<AddPersonWidget> createState() => _AddStepWidgetState();
}

class _AddStepWidgetState extends State<AddPersonWidget> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  void addInput() {
    final controller = TextEditingController();
    setState(() {
      _controllers.add(controller);
      widget.textList.call(_controllers);
    });
  }

  @override
  void initState() {
    widget.textList.call(_controllers);
    super.initState();
  }

  void removeInput(int index) {
    if (_controllers.isNotEmpty && index >= 0 && index < _controllers.length) {
      _controllers[index].dispose(); // 释放TextEditingController资源
      setState(() {
        _controllers.removeAt(index);
        widget.textList.call(_controllers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._controllers
            .asMap()
            .entries
            .map((entry) {
              int index = entry.key;
              TextEditingController controller = entry.value;
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                margin: EdgeInsets.only(bottom: 9.h),
                child: Row(
                  children: [
                    12.horizontalSpace,
                    Expanded(
                      child: TextField(
                        style: TextStyle(fontSize: 14.sp),
                        controller: controller,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Enter Attendees",
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFB9B9B9))),
                      ),
                    ),
                    if (index == 0)
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset(
                          "assets/images/ic_add.png",
                          width: 18,
                        ),
                        onPressed: () => addInput(),
                      ),
                    if (index > 0)
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image.asset(
                          "assets/images/ic_sub.png",
                          width: 18,
                        ),
                        onPressed: () => removeInput(index),
                      ),
                  ],
                ),
              );
            })
            .toList()
            .reversed,
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
