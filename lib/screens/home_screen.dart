import 'package:flutter/material.dart';
import 'package:ishita_singh/changables.dart';
import 'package:ishita_singh/screens/TechInfoScreen.dart';
import 'package:ishita_singh/screens/about_screen.dart';
import 'package:ishita_singh/screens/contact_screen.dart';
import 'package:ishita_singh/screens/experience_screen.dart';
import 'package:ishita_singh/screens/projects_screen.dart';
import 'package:ishita_singh/utilities/custom_text.dart';
import 'package:ishita_singh/utilities/socialLinks.dart';
import 'package:ishita_singh/utilities/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static late AutoScrollController controller;
  // static final autoScro itemPositionsListener = ItemPositionsListener.create();



  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
        valueListenable: changables.changableCount,
        builder: (context, value, _) {
          return Container(
             decoration:  BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(StrLiteral.background),
                
              //   fit: BoxFit.cover, // Adjust this property as needed (cover, contain, etc.)
              // ),
            ),
            child: Row(
              children: [
              //  Sociallinks.getSocialLinks(context),
                Expanded(
                  flex: 9,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    controller: controller,
                    children: <Widget>[
                      ...List.generate(5, (index) {
                        return AutoScrollTag(
                          key: ValueKey(index),
                          controller: controller,
                          index: index,
                          child: getScrollItem(index),
                          highlightColor: Colors.black.withOpacity(0.1),
                        );
                      }),
                    ],
                  ),
                ),
              //  Sociallinks.getMAilLink()
              ],
            ),
          );
        });
  }

  // HomeContent() {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //         left: Adaptive.w(5),
  //         right: Adaptive.w(5),
  //         top: Adaptive.h(10),
  //         bottom: Adaptive.w(20)),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           StrLiteral.introText0,
  //           style: TextStyle(
  //               color: AppColors.hoverTextColor,
  //               fontFamily: 'SFMono',
  //               fontWeight: FontWeight.w400,
  //               fontSize: 12.sp),
  //         ),
  //         SizedBox(
  //           height: Adaptive.h(2),
  //         ),
  //         Text(
  //           StrLiteral.introText1,
  //           style: TextStyle(
  //               color: AppColors.headColor,
  //               fontFamily: 'Calibre',
  //               fontWeight: FontWeight.w600,
  //               fontSize: 25.sp),
  //         ),
  //         Text(
  //           StrLiteral.introText2,
  //           style: TextStyle(
  //               color: AppColors.greyTextColor,
  //               fontFamily: 'Calibre',
  //               fontWeight: FontWeight.w600,
  //               fontSize: 25.sp),
  //         ),
  //         Padding(
  //           padding: EdgeInsets.only(top: Adaptive.w(3)),
  //           child: Text(
  //             StrLiteral.introText3,
  //             style: TextStyle(
  //                 color: AppColors.greyTextColor,
  //                 fontFamily: 'Calibre',
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 14.sp),
  //           ),
  //         ),
  //         // Padding(
  //         //   padding: EdgeInsets.only(top: Adaptive.w(5)),
  //         //   child: 
  //           TextButton(
  //               onPressed: () async {
  //                 var url = Uri.parse("mailto:ishitasingh150301@gmail.com");
  //                 if (await canLaunchUrl(url)) {
  //                   await launchUrl(url);
  //                 } else {
  //                   throw 'Could not launch ';
  //                 }
  //               },
  //               style: ButtonStyle(
  //                   side: MaterialStateProperty.all(BorderSide(
  //                       style: BorderStyle.solid,
  //                       color: AppColors.hoverTextColor,
  //                       width: 1.0))),
  //               child: Padding(
  //                 padding: EdgeInsets.all(15.sp),
  //                 child: Text(
  //                   'Get in Touch',
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: AppColors.hoverTextColor,
  //                       fontFamily: 'SFMono',
  //                       fontWeight: FontWeight.w200),
  //                 ),
  //               )),
  //         // )
  //       ],
  //     ),
  //   );
  // }


HomeContent(){
  return Container(
    // color: Colors.blue,
    padding: EdgeInsets.all(30),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height-80,
    child: Row(
      children: [
        imageContainer(),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Container(
            // color: Colors.green,
            child: Column(children: [
              introContainer(),
              
              contactContainer()
            ],),
          ),
        )
      ],
    ),
  );
}
  getScrollItem(int index) {
    // print(changables.changableCount.value);
    switch (index) {
      case 0:
        return Container(
          // color: AppColors.primaryColor,
          child: HomeContent(),
        );
      case 1:
        return Container(
          // color: AppColors.primaryColor,
          child: TechInfoScreen(),
        );

      case 2:
        return Container(
          // color: AppColors.primaryColor,
          child: ExperienceScreen(sw: MediaQuery.of(context).size.width),
        );
      case 3:
        return Container(
          // color: AppColors.primaryColor,
          child: ProjectsScreen(),
        );
      case 4:
        return Container(
          // color: AppColors.primaryColor,
          child: ConatactScreen(),
        );
    }
  }
}

imageContainer(){
  return Expanded(
    flex: 1,
  child: Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.amber,
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
        fit: BoxFit.cover,
        filterQuality: FilterQuality.low,
        image: AssetImage("assets/ishita.png")),
      borderRadius: BorderRadius.all(Radius.circular(40))),

      child: const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
        children: [
       Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text("Hello,",
            style: TextStyle(
              fontFamily: "Quicksand",
            fontSize: 26, color: Colors.white, fontWeight: FontWeight.w400)),
             Text("My name is Ishita",
            style: TextStyle(
              fontFamily: "Quicksand",
            fontSize: 70, color: Colors.white, fontWeight: FontWeight.w800))
          ],
        ),
         Text(StrLiteral.shortInfo,
         textAlign:TextAlign.end,
            style: TextStyle(
              fontFamily: "Quicksand",
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400)),
        ],
      )
  ),
  );
}
introContainer(){
  return Expanded(
    flex: 1,
  child: Container(
    // color: Colors.red,
    // padding: EdgeInsets.all(30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.cancelBtnText("Introduction",fontsize: 35),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black)
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               Text(StrLiteral.introText1,
            style: TextStyle(
              fontFamily: "Quicksand",
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
                Text(StrLiteral.introText0,
            style: TextStyle(
              fontFamily: "Quicksand",
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        )
      ],
    ),
  ),
  );
}
contactContainer(){
  return Expanded(
    flex: 1,
  child: Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    // padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      // color: Colors.amber,
      border: Border(top: BorderSide(color: Colors.black)),
    ),
child: Expanded(
  child: Column( 
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       SizedBox(height: 20),
      CustomText.cancelBtnText("Get in touch",fontsize: 35),
      SizedBox(height: 20),
     Expanded(
       child: Row(
        children: [
        giveContactContainer(Colors.black,Colors.white, StrLiteral.linkedIcon,"fha@gmail.com"),
        SizedBox(width: 20),
        giveContactContainer(Colors.blue,Colors.white,StrLiteral.githubIcon,"fha@gmail.com"),
        SizedBox(width: 20),
        giveContactContainer(Colors.white,Colors.black,StrLiteral.githubIcon,"fha@gmail.com"),
       ],),
     )
  ],),
),
  ),
  );
}

giveContactContainer(color,elColor,icon,head){
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: elColor),
        color: color
      ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(icon),
          Column(
            children: [
Text(head,style: TextStyle(color: elColor,fontSize: 20,fontFamily: "Quicksand"),) 
            ],
            )
        ],
      ),
    ),
  );
}

//we acn make widget list for multiple containers with single btn
//and add them to for loop within the length for their particular widgetlist
//then also show bottom dot or next btn to move if length associated is greater than 1
//can also add slide to next

//image add border dotted
