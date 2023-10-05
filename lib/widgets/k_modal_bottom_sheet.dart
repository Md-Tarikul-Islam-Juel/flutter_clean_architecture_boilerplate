import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

kShowBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet(
    // expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    builder: (context) => Container(
      // height: height,
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: IntrinsicHeight(child: child),
    ),
  );
}
