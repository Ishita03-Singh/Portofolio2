import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:ishita_singh/utilities/custom_text.dart';
import 'package:ishita_singh/utilities/strings.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:html' as html;

import 'package:visibility_detector/visibility_detector.dart';

class ProjectsScreen extends StatefulWidget {

  ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late var sw;
  // final ScrollController _scrollController = ScrollController();

  final List<Map<String,dynamic>> scrollProjects=[
    {
      
               'title':    'AvekShaka',
               'skills':  'Android Studio, Java, Firebase',
               'info':   'Monitor the security standards of people with dementia with repeated reminders. Contains exercises and notes for motor development.',
                'url':  'https://github.com/Ishita03-Singh/Avekshaka',
                'urlName':  'AvekShaka'
    },
    {
            
               'title':    'Covi-Eye',
               'skills':  'Android Studio, Java',
               'info':   'Measure heart rate and oxygen rate with camera and flashlight. User can share resulted value with current location.',
                'url':  'https://github.com/Ishita03-Singh/Covi-Eye',
                'urlName':  'Covi-Eye'
    },
    {
                'title':   'NewsFeed',
                  'skills':'Android Studio, Kotlin, News Api',
                'info':  'Shows trending news on daily update. It also allow users to select their field of interest and then display news related to that field of interest only.',
                'url':  'https://github.com/Ishita03-Singh/News-Feed',
                 'urlName': 'NewsFeed'
    },
     {
                'title':   'NewsFeed',
                  'skills':'Android Studio, Kotlin, News Api',
                'info':  'Shows trending news on daily update. It also allow users to select their field of interest and then display news related to that field of interest only.',
                'url':  'https://github.com/Ishita03-Singh/News-Feed',
                 'urlName': 'NewsFeed'
    },
     {
                'title':   'NewsFeed',
                  'skills':'Android Studio, Kotlin, News Api',
                'info':  'Shows trending news on daily update. It also allow users to select their field of interest and then display news related to that field of interest only.',
                'url':  'https://github.com/Ishita03-Singh/News-Feed',
                 'urlName': 'NewsFeed'
    }
    , {
                'title':   'NewsFeed',
                  'skills':'Android Studio, Kotlin, News Api',
                'info':  'Shows trending news on daily update. It also allow users to select their field of interest and then display news related to that field of interest only.',
                'url':  'https://github.com/Ishita03-Singh/News-Feed',
                 'urlName': 'NewsFeed'
    }
  ];
    final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  double _scrollPosition = 0.0;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      _scrollPosition += 2.0; // Adjust the scroll speed here
      if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
        _scrollPosition = 0.0;
      }
      _scrollController.jumpTo(_scrollPosition);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stopTimer();
    _scrollController.dispose();
    super.dispose();
  }
  
 

  @override
  Widget build(BuildContext context) {
    sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: Adaptive.w(5), right: Adaptive.w(5), bottom: Adaptive.w(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [


        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText.headText("Featured Project"),
          getProjectContainer(
              true,
              [StrLiteral.potfolioImage],
              "Web Design and Dev",
              "Lorem ipsum dolor sit amet",
              "Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
              "https://github.com/Ishita03-Singh/Ishita03-Singh.github.io"),

              getProjectContainer(
              false,
              [StrLiteral.project21,StrLiteral.project22,StrLiteral.project23],
              "Web Design and Dev",
              "Lorem ipsum dolor sit amet",
              "Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
              "https://github.com/Ishita03-Singh/Ishita03-Singh.github.io"),

             
        ],
      ),
      SizedBox(height: Adaptive.h(3)),
      
        Text(
          "Other Things I've Built",
          style: TextStyle(
              color: AppColors.headColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
        Container(
          color: AppColors.greyTextColor,
          width: sw,
          height: 2,
        ),
        VisibilityDetector(
        key: Key('tape-scroll'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.0 && !_isVisible) {
            _isVisible = true;
            _startTimer();
          } else if (info.visibleFraction == 0.0 && _isVisible) {
            _isVisible = false;
            _stopTimer();
          }
        },
        child: Container(
                 height: Adaptive.h(40),
                child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _scrollController,
                          itemCount: scrollProjects.length, // Adjust the item count as needed
                          itemBuilder: (context, index) {
                            return giveProjectCard(scrollProjects[index]['title'],
                            scrollProjects[index]['skills'],scrollProjects[index]['info'],
                            scrollProjects[index]['info'],scrollProjects[index]['urlName']
                            );
                //             return Container(
                // width: Adaptive.w(30),
                // height: Adaptive.h(30),
                // margin: EdgeInsets.symmetric(horizontal: 10.0),
                // color: Colors.blue,
                // child: Center(
                //   child: Text(
                //     '$index',
                //     style: TextStyle(color: Colors.white, fontSize: 24.0),
                //   ),
                // ),
                //             );
                          },
                        ),
              ),)
        // Padding(
        //   padding: EdgeInsets.only(top: Adaptive.h(10)),
        //   child: showProjectsColumn(),
        // )
      ]),
    );
  }

 getProjectContainer(bool isweb, List<String> imgPaths, String topic,
      String head, String info, String link) {
    return Container(
      margin: EdgeInsets.only(top: 30,bottom: 10),
      // width: MediaQuery.of(context).size.width / 1.5,
            //  width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(20),
      
      decoration: BoxDecoration(
        color: AppColors.bgProgressTextColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(
        //   color: AppColors.primaryColor.withOpacity(0.4),
        // ),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            // width: MediaQuery.of(context).size.width/3,
             width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(40),
            child: isweb
              ? Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(imgPaths[0]))
              : Row(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      // width: MediaQuery.of(context).size.width/6.5,
                       width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(20),
                      child: Image.asset(imgPaths[0])),
                    Column(
                      children: [
                        Container(
            // width: MediaQuery.of(context).size.width/6.5,
             width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(20),
                          // width: ,
                          child: Image.asset(imgPaths[1])),
                        SizedBox(height: 20,),
                        Container(
                           width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(20),
                          // width: MediaQuery.of(context).size.width/6.5,
                          child: Image.asset(imgPaths[2]))
                      ],
                    ),]
              ),),
          
                    Container(
                      padding: EdgeInsets.all(22),
                      // width: MediaQuery.of(context).size.width/3.3,
                       width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(30),
                      // color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text(topic,style: TextStyle(color: AppColors.hoverTextColor),),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          CustomText.largeHeadText(head),
                           CustomText.infoText(info),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                            margin: EdgeInsets.only(top: 20),

                              width: Adaptive.w(3),
                              height: Adaptive.w(3),padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                              child: Image.asset(StrLiteral.navigateArrow,color: AppColors.hoverTextColor,),),
                          )
                        ],
                      ),
                    )
                  ],
                )
        
      
    );
  }

  // showProjectsColumn() {
  //   return Column(
  //     children: [
  //       IntrinsicHeight(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             giveProjectCard(
  //                 'https://github.com/Ishita03-Singh/Avekshaka/raw/master/avekshaka%20snapshots/1656184460448_100.PNG',
  //                 'AvekShaka',
  //                 'Android Studio, Java, Firebase',
  //                 'Monitor the security standards of people with dementia with repeated reminders. Contains exercises and notes for motor development.',
  //                 'https://github.com/Ishita03-Singh/Avekshaka',
  //                 'AvekShaka'),
  //             SizedBox(
  //               width: Adaptive.w(10),
  //             ),
  //             giveProjectCard(
  //                 'https://github.com/Ishita03-Singh/Covi-Eye/raw/master/WhatsApp%20Image%202021-11-14%20at%205.40.45%20PM%20(2).jpeg',
  //                 'Covi-Eye',
  //                 'Android Studio, Java',
  //                 'Measure heart rate and oxygen rate with camera and flashlight. User can share resulted value with current location.',
  //                 'https://github.com/Ishita03-Singh/Covi-Eye',
  //                 'Covi-Eye'),
  //           ],
  //         ),
  //       ),
  //       SizedBox(
  //         height: Adaptive.h(4),
  //       ),
  //       IntrinsicHeight(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             giveProjectCard(
  //                 'https://github.com/Ishita03-Singh/News-Feed/raw/master/screenshot%203.jpeg',
  //                 'NewsFeed',
  //                 'Android Studio, Kotlin, News Api',
  //                 'Shows trending news on daily update. It also allow users to select their field of interest and then display news related to that field of interest only.',
  //                 'https://github.com/Ishita03-Singh/News-Feed',
  //                 'NewsFeed'),
  //             SizedBox(
  //               width: Adaptive.w(10),
  //             ),
  //             giveProjectCard(
  //                 'https://github.com/Ishita03-Singh/Avekshaka/raw/master/avekshaka%20snapshots/1656184460448_100.PNG',
  //                 'AvekShaka',
  //                 'Android Studio, Java, Firebase',
  //                 'Monitor the security standards of people with dementia with repeated reminders. Contains exercises and notes for motor development.',
  //                 'https://github.com/Ishita03-Singh/Avekshaka',
  //                 'AvekShaka'),
  //           ],
  //         ),
  //       )
  //     ],
  //   );
  // }

  giveProjectCard( String projectTitle, String tech,
      String description, String projectURL, String projectURLName) {
    return Container(
      margin: EdgeInsets.all(Adaptive.w(2)),
      decoration: BoxDecoration(
        color: AppColors.bgProgressTextColor.withOpacity(0.6),
        // borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      // color: Colors.green,
      child: Row(
        children: [
          // if ((sw) >= 450) giveProjectImage(imageURL),
          Container(
            width: sw <= 450 ? Adaptive.w(30) : Adaptive.w(20),
            padding: EdgeInsets.all(Adaptive.w(2)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    projectTitle,
                    style: TextStyle(
                        color: AppColors.headColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Adaptive.h(2)),
                  Text(
                    description,
                    style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Adaptive.h(2)),
                  Container(
                    height: 1.3,
                    color: AppColors.greyTextColor,
                  ),
                  SizedBox(height: Adaptive.h(2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Adaptive.w(10),
                        child: Text(
                          tech,
                          style: TextStyle(
                              color: AppColors.hoverTextColor,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'SFMono',
                              fontSize: 10.sp),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            html.window.open(projectURL, projectURLName);
                          },
                          child: Image.network(
                            'https://cdn-icons-png.flaticon.com/128/2111/2111425.png',
                            width: Adaptive.w(2),
                            color: AppColors.darkgreyColor,
                          ))
                    ],
                  ),
                ]),
          )
        ],
      ),
    );
  }

  giveProjectImage(String imageURL) {
    return Container(
      child: Image.network(
        imageURL,
        fit: BoxFit.fill,
        width: Adaptive.w(10),
      ),
    );
  }
}
