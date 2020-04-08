import 'package:flutter/material.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';

class FontFamily {
  static String black = "Muli-Black";
  static String blackItalic = "Muli-BlackItalic";
  static String bold = "Muli-Bold";
  static String boldItalic = "Muli-BoldItalic";
  static String italic = "Muli-Italic";
  static String light = "Muli-Light";
  static String lightItalic = "Muli-LightItalic";
  static String medium = "Muli-Medium";
  static String mediumItalic = "Muli-MediumItalic";
  static String regular = "Muli-Regular";
}

class TextStyles {
  static TextStyle get snackBarText => TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s15,
        color: Colors.white,
        letterSpacing: 1.4,
        inherit: false,
      );

  static TextStyle get appName => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSize.s26,
        color: AppColors.primary,
        shadows: [
          Shadow(
              // bottomLeft
              offset: Offset(-1.5, -1.5),
              color: Colors.black),
          Shadow(
              // bottomRight
              offset: Offset(1.5, -1.5),
              color: Colors.black),
          Shadow(
              // topRight
              offset: Offset(1.5, 1.5),
              color: Colors.black),
          Shadow(
              // topLeft
              offset: Offset(-1.5, 1.5),
              color: Colors.black),
        ],
        letterSpacing: 5.0,
        inherit: false,
      );

  static TextStyle get editText => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s16,
        color: Colors.black,
        inherit: false,
        textBaseline: TextBaseline.alphabetic,
        letterSpacing: 3.0,
      );

  static TextStyle get labelStyle => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s16,
        color: Colors.grey,
        inherit: false,
      );

  static TextStyle get errorStyle => TextStyle(
        fontFamily: FontFamily.light,
        fontSize: FontSize.s12,
        color: Colors.red,
        inherit: false,
      );

  static TextStyle get buttonText => TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s15,
        color: Colors.white,
        inherit: false,
      );

  static TextStyle get loginTitle => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSize.s24,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get loginSubTitle => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s14,
        color: Colors.grey,
        inherit: false,
      );

  static TextStyle get smallTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s10,
        color: Colors.grey,
        inherit: false,
      );
  static TextStyle get smallGreyTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s10,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get smallWhiteTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s10,
        color: Colors.white,
        inherit: false,
      );

  static TextStyle get minorTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s8,
        color: Colors.grey,
        inherit: false,
      );

  static TextStyle get mediumTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s11,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get smallTextPrimaryColorLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s11,
        color: AppColors.primary,
        inherit: false,
      );

  static TextStyle get bottomNavigationBarTextLabel => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSize.s11,
      );

  static TextStyle get drawerItemTextLabel => TextStyle(
      fontFamily: FontFamily.medium,
      fontSize: FontSize.s14,
      color: Colors.grey[800]);

  static TextStyle get drawerHeaderUserNameTextLabel => TextStyle(
      fontFamily: FontFamily.bold, fontSize: FontSize.s14, color: Colors.white);

  static TextStyle get popupMenuItemTextLabel => TextStyle(
      fontFamily: FontFamily.bold,
      fontSize: FontSize.s12,
      color: Colors.grey[800]);

  static TextStyle get semiBoldLabelStyle => TextStyle(
        fontFamily: FontFamily.medium,
        fontSize: FontSize.s16,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get blackBoldTextLabel => TextStyle(
        fontFamily: FontFamily.bold,
        fontSize: FontSize.s14,
        color: Colors.black,
        inherit: false,
      );

  static TextStyle get blackRegularTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s11,
        color: Colors.black,
        inherit: false,
      );
  static TextStyle get errorTextLabel => TextStyle(
        fontFamily: FontFamily.regular,
        fontSize: FontSize.s11,
        color: Colors.red,
        inherit: false,
      );
}
