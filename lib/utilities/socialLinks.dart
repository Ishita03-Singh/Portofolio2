import 'package:flutter/material.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'dart:html' as html;

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Sociallinks {

  static  getSocialLinks(BuildContext context){
       return Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            html.window.open(
                                'https://www.linkedin.com/in/ishita-singh-creater/',
                                'LinkedIn');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width >
                                    MediaQuery.of(context).size.height
                                ? Adaptive.w(2)
                                : Adaptive.h(3),
                            child: Image.asset(
                              'assets/linkedin.png',
                              color: AppColors.hoverTextColor,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        InkWell(
                          onTap: () {
                            html.window.open(
                                'https://github.com/Ishita03-Singh/', 'Github');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width >
                                    MediaQuery.of(context).size.height
                                ? Adaptive.w(2)
                                : Adaptive.h(3),
                            child: Image.asset(
                              'assets/github.png',
                              color: AppColors.hoverTextColor,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        InkWell(
                          onTap: () {
                            html.window.open(
                                'https://www.instagram.com/iishitaaasingh/',
                                'instagram');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width >
                                    MediaQuery.of(context).size.height
                                ? Adaptive.w(2)
                                : Adaptive.h(3),
                            child: Image.asset(
                              'assets/instagram.png',
                              color: AppColors.hoverTextColor,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width >
                                    MediaQuery.of(context).size.height
                                ? Adaptive.w(2)
                                : Adaptive.h(3),
                            child: Image.asset(
                              'assets/behance.png',
                              color: AppColors.hoverTextColor,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        InkWell(
                          onTap: () {
                            html.window.open(
                                'https://twitter.com/ISHITAS49743589', 'Twitter');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width >
                                    MediaQuery.of(context).size.height
                                ? Adaptive.w(2)
                                : Adaptive.h(3),
                            child: Image.asset(
                              'assets/twitter.png',
                              color: AppColors.hoverTextColor,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Adaptive.h(2)),
                        Container(
                          width: 1,
                          height: MediaQuery.of(context).size.height / 4,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                );
  }

  static getMAilLink(){
    return  Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          var url =
                              Uri.parse("mailto:singh.ishita.atwork@gmail.com");
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch ';
                          }
                        },
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'singh.ishita.atwork@gmail.com',
                            style: TextStyle(
                                color: AppColors.hoverTextColor,
                                fontSize: 16.sp,
                                fontFamily: 'SFMono',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(2)),
                      Container(
                        width: 1,
                        height: Adaptive.h(10),
                        color: Colors.white,
                      )
                    ],
                  ),
                ));
  }
}