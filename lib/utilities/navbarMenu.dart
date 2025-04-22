import 'package:flutter/material.dart';
import 'package:ishita_singh/changables.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:ishita_singh/utilities/custom_text.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../screens/home_screen.dart';

class Navbarmenu {


static getNavVarMenuExpanded(int index, String text,) {
  // var previous= changables.changableCount.value;

  ValueNotifier<bool> isHovered = ValueNotifier(false);
  // print(isHovered.value);
  return MouseRegion(
    onEnter: (_) => isHovered.value = true,
    onExit: (_) => isHovered.value = false,
    child: ValueListenableBuilder<bool>(
      valueListenable: isHovered,
      builder: (context, hovered, child) {
        return GestureDetector(
          onTap: () async {
            await HomePageState.controller
                .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
              // isHovered.value = true;
            changables.changableCount.value = index;
          },
          child: Container(alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(left: 20,right: 10),
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isHovered.value ? Colors.black : Colors.transparent,
                  width: 3.0, // Adjust thickness as needed
                ),
              ),
            ),
            child: CustomText.navbar(text),
          ),
        );
      },
    ),
  );
}
}