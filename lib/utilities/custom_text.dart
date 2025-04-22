import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import '../Utilities/colors.dart';

class CustomText {
  static Text appNameText(String text, {bool isCenter = false}) => Text(text,
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      style: const TextStyle(
          fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700));


  static Text headText(String text) => Text(text,
      style: const TextStyle(
        // fontFamily: "Lalezar",
          fontSize: 60, color: Color(0xFF25171c), fontWeight: FontWeight.w900));

          
  static Text largeHeadText(String text) => Text(text,
      style: const TextStyle(
        // fontFamily: "Lalezar",
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900));

  static Text infoText(String text, {bool isCenter = false}) => Text(text,
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300));


  static Text navbar(String text, {bool isCenter = false}) => Text(text,
      textAlign: isCenter ? TextAlign.center : TextAlign.left,
      style: TextStyle(
          fontSize: 13.sp,
          fontFamily: "SFMono",
          color: Colors.black,
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
}
