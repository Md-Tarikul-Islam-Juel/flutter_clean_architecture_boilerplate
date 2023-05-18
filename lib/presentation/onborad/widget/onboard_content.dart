import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/custom_style.dart';
import '../../../../utils/size_constant.dart';

class OnboardContent extends HookConsumerWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 30.h,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        gap4,
        SizedBox(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: CustomStyle.customStyleInstance.onboardTitleStyle,
          ),
        ),
        gap2,
        Text(
          description,
          textAlign: TextAlign.center,
          style: CustomStyle.customStyleInstance.onboardDescriptionStyle,
        ),
      ],
    );
  }
}
