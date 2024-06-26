import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
// import '../Utilities/colors.dart';

class MyButtonStyle {
  static ButtonStyle appbarButton = TextButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      fixedSize: const Size(50, 50),
      elevation: 0,
      minimumSize: const Size(50, 10),
      padding: EdgeInsets.zero);

  static ButtonStyle overlay_buttons_left = TextButton.styleFrom(
    minimumSize: const Size(double.infinity, 40),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    side: BorderSide(color: AppColors.greyTextColor.withOpacity(0.3)),
    alignment: Alignment.centerLeft,
    backgroundColor: AppColors.primaryColor,
  );
  static ButtonStyle overlay_viewButtons = TextButton.styleFrom(
    minimumSize: const Size(double.infinity, 40),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0))),
    side: BorderSide(color: AppColors.greyTextColor.withOpacity(0.3)),

    alignment: Alignment.centerLeft,
    backgroundColor: AppColors.primaryColor,

    foregroundColor: AppColors.primaryColor,
    // minimumSize: const Size(double.infinity, 40),
    // alignment: Alignment.centerLeft,
    // backgroundColor: AppColor.bgColor,
    // elevation: 2,
    // shadowColor: AppColor.tertiaryColor
  );

  static ButtonStyle overlay_streamButton(bool selected) =>
      TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        side: BorderSide(
            color: selected
                ? AppColors.hoverTextColor
                : AppColors.greyTextColor.withOpacity(0.3)),

        alignment: Alignment.centerLeft,
        backgroundColor:
            selected ? AppColors.hoverTextColor : AppColors.primaryColor,

        // foregroundColor:
        //     selected ? AppColor.secondaryColor : AppColor.secondaryColor,
        // backgroundColor: selected ? AppColor.bgColor : AppColor.bgColor,
        // elevation: 2,
        // shadowColor:
        //     selected ? AppColor.tertiaryColor : AppColor.tertiaryColor
      );
}
