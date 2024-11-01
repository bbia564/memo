import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({super.key, required this.color, required this.isCheck});

  final Color color;
  final bool isCheck;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        if (isCheck)
          Image.asset(
            "assets/images/ic_check.png",
            width: 14,
          )
      ],
    );
  }
}
