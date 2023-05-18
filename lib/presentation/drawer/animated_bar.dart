import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2.h),
      height: 4.h,
      width: isActive ? 20.w : 0,
      decoration: BoxDecoration(
        color: const Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
      ),
    );
  }
}
