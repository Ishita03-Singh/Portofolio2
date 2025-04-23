import 'package:flutter/material.dart';
import 'package:ishita_singh/changables.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  late String val;

  @override
  Widget build(BuildContext context) {
    // sw = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
        valueListenable: changables.changableCount,
        builder: (context, value, _) {
          val = value.toString();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Container(
              padding: EdgeInsets.all(30),
                      decoration: const BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                     
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     ShowSkills() 
                  ],
                ),
              ),
            ],
          );
        });
  }

  ShowSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.sp),
          child: Text(
            'Skills',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Quicksand",
                fontSize: 18.sp,
                fontWeight: FontWeight.w800),
          ),
        ),
        showSkillsinRow() 
      ],
    );
  }

  showNull() {
    return Container();
  }

  showSkillsinRow() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration
      (
        // color: Colors.black,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Column(
            children: [
              skillbar(0.8, 'Flutter'),
              skillbar(0.7, 'Android'),
              skillbar(0.9, 'C/C++'),
            ],
          ),
          SizedBox(
            width: Adaptive.w(20),
          ),
          Column(
            children: [
              skillbar(0.6, 'Java'),
              skillbar(0.6, 'MySQL'),
              skillbar(0.5, 'C/C++'),
            ],
          )
        ],
      ),
    );
  }

  showSkillsinColumn() {
    return Column(
      children: [
        skillbar(0.5, 'Android'),
        skillbar(0.5, 'C/C++'),
        skillbar(0.5, 'C/C++'),
        skillbar(0.5, 'C/C++'),
        skillbar(0.5, 'C/C++'),
        skillbar(0.5, 'C/C++'),
      ],
    );
  }

  skillbar(double percentage, String titleText) {
    // print(changables.changableCount.value);
    // print("jkhkjh");
    return Padding(
      padding: EdgeInsets.only(top: 7.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp),
          ),
          LinearPercentIndicator(
            key: Key(val),
            width: Adaptive.w(25),
            lineHeight: Adaptive.w(0.6),
            percent: percentage,
            animation: true,
            animationDuration: 2000,
            backgroundColor: Color.fromARGB(255, 184, 183, 186),
            barRadius: Radius.circular(20.sp),
            progressColor: AppColors.hoverTextColor.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
