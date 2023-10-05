import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';
import 'dimensions.dart';
import 'text_theme_style_x.dart';

class CustomStyle {
  CustomStyle._();

  static final CustomStyle _customStyle = CustomStyle._();

  static get customStyleInstance => _customStyle;

  final textFieldStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    color: useContext().color.shadow,
  );

  //? Onboard Screen
  final onboardSkipStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: useContext().color.shadow,
  );

  final onboardTitleStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.bold,
    color: useContext().color.shadow,
  );

  final onboardDescriptionStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w600,
    color: useContext().color.shadow.withOpacity(0.8),
  );

  //? Settings Screen
  final settingsTitleStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    color: useContext().color.onPrimaryContainer,
  );
}
