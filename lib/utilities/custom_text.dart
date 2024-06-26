import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
// import '../Utilities/colors.dart';

class CustomText {
  static Text appNameText(String text, {bool isCenter = false}) => Text(text,
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700));
  static Text headText(String text) => Text(text,
      style: TextStyle(
        // fontFamily: "Lalezar",
          fontSize: 60, color: Colors.white, fontWeight: FontWeight.w900));
  static Text largeHeadText(String text) => Text(text,
      style: TextStyle(
        // fontFamily: "Lalezar",
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900));

  static Text infoText(String text, {bool isCenter = false}) => Text(text,
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300));


       static Stack highlightText(String text, {bool isCenter = false}) => Stack(
      children: <Widget>[
        // Outline
        // Text(
        //   text,
        //   style: TextStyle(
        //     fontSize: 120,
        //     // letterSpacing: 3,
        //     fontWeight: FontWeight.w400,
        //     // fontFamily: "Lalezar",
        //     foreground: Paint()
        //       ..style = PaintingStyle.stroke
        //       ..strokeWidth = 6
        //       ..color = Colors.white,
        //   ),
        // ),
        // Filled text
        Text(
          text,
          style:  TextStyle(
            fontSize: 120,
            // fontFamily: "Lalezar",
            // letterSpacing: 3,
            fontWeight: FontWeight.w900,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );

  // static Text text(String text, {double fontsize = 16}) => Text(
  //     textAlign: TextAlign.left,
  //     text,
  //     style: TextStyle(fontSize: fontsize, color: AppColor.primaryTextColor));

  // static Text textFieldHeadText(String text, {double fontsize = 13}) => Text(
  //     textAlign: TextAlign.left,
  //     text,
  //     style: TextStyle(
  //         fontSize: fontsize,
  //         color: AppColor.primaryTextColor,
  //         fontWeight: FontWeight.w400));

  static cancelBtnText(String text, {double fontsize = 22}) => Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          fontSize: fontsize,
        fontFamily: "Calibre",
          color: Colors.black,
          fontWeight: FontWeight.w600));
  static taskBtnText(String text, {double fontsize = 32}) => Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontFamily: "Calibre",
          fontSize: fontsize,
          color: AppColors.primaryColor.withOpacity(0.7),
          fontWeight: FontWeight.w600));

  // static Text text16primary(String text) => Text(text,
  //     style: TextStyle(
  //         fontSize: 14,
  //         color: AppColor.secondaryTextColor,
  //         fontWeight: FontWeight.w400));

  // static Text text12hintColor(String text,
  //         {TextAlign textAlign = TextAlign.left}) =>
  //     Text(text,
  //         textAlign: textAlign,
  //         style: TextStyle(
  //             fontSize: 14,
  //             color: AppColor.secondaryTextColor,
  //             fontWeight: FontWeight.w400));

  // static Text serverName(String text, {double fontsize = 14}) => Text(text,
  //     maxLines: 1,
  //     overflow: TextOverflow.ellipsis,
  //     style: TextStyle(
  //         fontSize: fontsize,
  //         color: AppColor.primaryTextColor,
  //         fontWeight: FontWeight.w500));

  // static Text bottomSheetText(String text, {double fontsize = 14}) => Text(
  //     textAlign: TextAlign.left,
  //     text,
  //     style: TextStyle(
  //         fontSize: fontsize,
  //         color: AppColor.iconColor,
  //         fontWeight: FontWeight.w500));

  // static Text text16Secondary(String text,
  //         {TextAlign textAlign = TextAlign.left}) =>
  //     Text(text,
  //         textAlign: textAlign,
  //         style: TextStyle(
  //             fontSize: 16,
  //             color: AppColor.secondaryTextColor,
  //             fontWeight: FontWeight.w400));

  // //full_screen_video.dart
  // static Text topVideoDateTimePosition(String text) => Text(text,
  //     style: TextStyle(color: AppColor.primaryTextColor, fontSize: 20));
  // static Text bottomVideoPosition(String text) => Text(text,
  //     style: TextStyle(color: AppColor.primaryTextColor),
  //     textAlign: TextAlign.right);
  // static Text bottomVideoTotalDuration(String text) => Text(text,
  //     style: TextStyle(color: AppColor.primaryTextColor),
  //     textAlign: TextAlign.left);
}
