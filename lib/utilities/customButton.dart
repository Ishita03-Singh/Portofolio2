import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ishita_singh/Utilities/button_style.dart';
// import 'package:ishita_singh/utilities/AppColorss.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:ishita_singh/utilities/custom_text.dart';
// import '../Utilities/button_style.dart';
// import '../Utilities/colors.dart';
// import 'custom_outlined_icons_icons.dart';
// import 'custom_text.dart';

class CustomButton {
  // addServerButton(Function onpress) => ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.tertiaryColor,
  //       foregroundColor: AppColors.tertiaryColor,
  //       elevation: 5,
  //       padding: const EdgeInsets.all(10),
  //       shadowColor: AppColors.secondaryColor,
  //       shape: const CircleBorder(),
  //       side: BorderSide(color: AppColors.tertiaryColor, width: 2),
  //       fixedSize: const Size(52, 52),
  //     ),
  //     onPressed: () => onpress(),
  //     child: Icon(Icons.add, color: AppColors.tertiaryTextColor));

  overlayButton(IconData icon, String text, Function onPress) => Padding(
      padding: kIsWeb
          ? const EdgeInsets.fromLTRB(0, 10, 0, 0)
          : const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextButton(
          onPressed: () => onPress(),
          style: MyButtonStyle.overlay_buttons_left,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style:
                    TextStyle(color: AppColors.greyTextColor, fontSize: 16),
              ),
              Icon(
                icon,
                color: AppColors.iconColor,
                size: 20,
              ),
            ],
          )));

  iconButton(BuildContext context, String msg, IconData icon, Function() fun) =>
      Tooltip(
          message: msg,
          child: IconButton(
              // color: AppColors.bgColor,
              onPressed: fun,
              //splashColor: AppColors.secondaryColor.withOpacity(0.5),
              // CustomNavigator.pushRTL(context, const Settings()),
              // const Settings()),
              style: TextButton.styleFrom(
                  // backgroundColor: AppColors.bgColor,
                  fixedSize: const Size(10, 10),
                  elevation: 0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.zero),
              icon: Icon(icon, color: Colors.black)));

  // cancel Button -> LoaderOverlay - Lottie Animation
  cancelButton(String text, Function onPressed) => TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: AppColors.hoverTextColor,
          backgroundColor: AppColors.hoverTextColor,
          // minimumSize: const Size(100, 30),
          elevation: 0,
          shadowColor: AppColors.primaryColor),
      onPressed: () => onPressed(),
      child: CustomText.cancelBtnText(text));

  taskButton(String text, Function() onPressed) => TextButton(
      style: TextButton.styleFrom(
    
          padding: const EdgeInsets.fromLTRB(30,15,30,10),
          side:BorderSide(color: Colors.white.withOpacity(0.3),width:1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          foregroundColor: AppColors.hoverTextColor,
          backgroundColor: Colors.white.withOpacity(0.2),
          // minimumSize: const Size(100, 30),
          elevation: 0,
          shadowColor: AppColors.hoverTextColor),
      onPressed: onPressed,
      child: CustomText.taskBtnText(text,fontsize: 24));

  smalltaskButton(String text, Function() onPressed) => TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: AppColors.hoverTextColor,
          backgroundColor: Colors.black,
          // minimumSize: const Size(100, 30),
          elevation: 0,
          shadowColor: AppColors.hoverTextColor),
      onPressed: onPressed,
      child: CustomText.taskBtnText(text, fontsize: 11));

  gridButton(BuildContext context, int index, String msg, IconData icon,
          Function fun) =>
      Tooltip(
          message: msg,
          child: IconButton(

              // color: AppColors.bgColor,
              //  onPressed: () => onPressed(index),
              onPressed: () => fun(index),
              // CustomNavigator.pushRTL(context, const Settings()),
              // const Settings()),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                  // backgroundColor: Colors.amber,
                  // fixedSize: const Size(20, 20),
                  elevation: 0,
                  // minimumSize: const Size(50, 10),
                  padding: EdgeInsets.zero),
              icon: Icon(
                icon,
                color: AppColors.iconColor,
                size: 20,
              )));

  closeButton(BuildContext context, int index, String msg, IconData icon,
          Function fun) =>
      Tooltip(
          message: msg,
          child: IconButton(

              // color: AppColors.bgColor,
              //  onPressed: () => onPressed(index),
              onPressed: () => fun(index),
              // CustomNavigator.pushRTL(context, const Settings()),
              // const Settings()),

              constraints: const BoxConstraints(),
              style: IconButton.styleFrom(
                  // backgroundColor: Colors.amber,
                  // fixedSize: const Size(20, 20),
                  elevation: 0,
                  // minimumSize: const Size(50, 10),
                  padding: EdgeInsets.zero),
              icon: Icon(
                icon,
                color: Colors.red,
                size: 20,
              )));

  // scBarButton(BuildContext context, String msg, IconData icon, Function() fun) {
  //   return Column(
  //     children: [
  //       IconButton(
  //           // color: AppColors.bgColor,
  //           onPressed: fun,
  //           // CustomNavigator.pushRTL(context, const Settings()),
  //           // const Settings()),
  //           style: TextButton.styleFrom(
  //               backgroundColor: AppColorss.,
  //               fixedSize: const Size(20, 20),
  //               elevation: 0,
  //               minimumSize: const Size(20, 20),
  //               padding: EdgeInsets.zero),
  //           icon: Icon(icon, color: AppColorss.iconColor)),
  //       Text(
  //         msg,
  //         style: TextStyle(
  //             color: AppColorss.iconColor,
  //             fontSize: 12,
  //             fontWeight: FontWeight.w500),
  //       )
  //     ],
  //   );
  // }

  customTextButton(Widget child, Function() fun,
      {Color color = Colors.transparent}) {
    return TextButton(
      onPressed: fun,
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
      child: child,
    );
  }
}

CustomButton customButton = CustomButton();
