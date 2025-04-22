import 'package:flutter/material.dart';
import 'package:ishita_singh/changables.dart';
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
    padding: EdgeInsets.all(20),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height-50,
    child: Row(
      children: [
        imageContainer(),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: Column(children: [
            introContainer(),
            
            contactContainer()
          ],),
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
          child: AboutScreen(),
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
    padding: EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.amber,
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
        fit: BoxFit.fill,
        filterQuality: FilterQuality.low,
        image: NetworkImage("data:image/jpeg;base64,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")),
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
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.w300)),
             Text("My name is Ishita",
            style: TextStyle(
            fontSize: 100, color: Colors.white, fontWeight: FontWeight.w900))
          ],
        ),
         Text(StrLiteral.shortInfo,
         textAlign:TextAlign.end,
            style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300)),
        ],
      )
  ),
  );
}
introContainer(){
  return Expanded(
    flex: 1,
  child: Container(
    padding: EdgeInsets.all(30),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.headText("Introduction"),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black)
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               Text(StrLiteral.introText1,
            style: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600)),
                Text(StrLiteral.introText0,
            style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300)),
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
    padding: EdgeInsets.all(30),
    decoration: BoxDecoration(
      border: Border(top: BorderSide(color: Colors.black)),
    ),
child: Expanded(
  child: Column( 
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
     CustomText.headText("Get in touch"),
     Expanded(
       child: Row(
        children: [
        giveContactContainer(Colors.black,Colors.white, Icons.mail,"fha@gmail.com"),
        SizedBox(width: 20),
        giveContactContainer(Colors.blue,Colors.white,Icons.linked_camera_outlined,"fha@gmail.com"),
        SizedBox(width: 20),
        giveContactContainer(Colors.white,Colors.black,Icons.beach_access_rounded,"fha@gmail.com"),
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
          Icon(icon,color: elColor,size: 60),
          Text(head,style: TextStyle(color: elColor,fontSize: 20),)
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
