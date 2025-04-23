import 'package:flutter/material.dart';
import 'package:ishita_singh/changables.dart';
import 'package:ishita_singh/screens/home_screen.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:ishita_singh/utilities/custom_text.dart';
import 'package:ishita_singh/utilities/navbarMenu.dart';
import 'package:ishita_singh/utilities/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../utilities/hovericon.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFf4f4f2),
      appBar: sw <= 600 ? showSmallNavBar() : showWideNavbar(),
      endDrawer: sw >= 600 ? null : showNavBar(),
      body: HomePage(),
    );
  }

  PreferredSizeWidget showWideNavbar() {
    return AppBar(
      leadingWidth: 100,
      leading:  Container(
        // color: Colors.amber,
        padding: EdgeInsets.only(top: 20,bottom: 10),
        child:  HoverIconButton(imagePath: StrLiteral.resume),
        ),
      foregroundColor: Color(0xFFf4f4f2),
      surfaceTintColor: Color(0xFFf4f4f2),
      bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // Height of the border
            child: Container(
              color: Colors.black, // Border color
              height: 1.0, // Thickness of the border
            ),
      ),
      toolbarHeight: 80,
      backgroundColor: Color(0xFFf4f4f2),
      titleSpacing: 0,
      elevation: 0,
      toolbarTextStyle: TextStyle(fontSize: 12.sp),
      actions: [
        Navbarmenu.getNavVarMenuExpanded(0,"About me"),
        Navbarmenu.getNavVarMenuExpanded(1,"Resume"),
        Navbarmenu.getNavVarMenuExpanded(2,"Work"),
        Navbarmenu.getNavVarMenuExpanded(3,"Projects"),
     
      ],
    );
  }

  PreferredSizeWidget showSmallNavBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      // title: Image.asset(
      //   'assets/I.png',
      //   width: 50,
      // ),
      toolbarHeight: 100,
    );
  }

  Widget showNavBar() {
    return Drawer(
      backgroundColor: AppColors.bgProgressTextColor.withOpacity(0.7),
      child: ListView(
        padding: const EdgeInsets.only(
          left: 8,
          top: 80,
        ),
        children: [
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '01.',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                        color: AppColors.headColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
              changables.changableCount.value += 1;
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '02.',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                  Text(
                    'Experience',
                    style: TextStyle(
                        color: AppColors.headColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '03.',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                  Text(
                    'Projects',
                    style: TextStyle(
                        color: AppColors.headColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              Navigator.pop(context);
              await HomePageState.controller
                  .scrollToIndex(3, preferPosition: AutoScrollPosition.begin);
            },
          ),
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(
                top: Adaptive.h(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '04.',
                    style: TextStyle(
                        color: AppColors.hoverTextColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: AppColors.headColor,
                        fontSize: 18.sp,
                        fontFamily: 'SFMono'),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await HomePageState.controller
                  .scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                top: Adaptive.h(5),
                left: Adaptive.w(15),
                right: Adaptive.w(15)),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.hoverTextColor,
                      width: 1.0))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Resume',
                  style: TextStyle(
                      fontSize: 12,
                      color: AppColors.hoverTextColor,
                      fontFamily: 'SFMono'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
