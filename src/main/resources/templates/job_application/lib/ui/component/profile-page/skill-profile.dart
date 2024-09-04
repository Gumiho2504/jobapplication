import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/style/style.dart';

class SkillsPageView extends StatefulWidget {
  const SkillsPageView({super.key});

  @override
  State<SkillsPageView> createState() => _SkillsPageViewState();
}

class _SkillsPageViewState extends State<SkillsPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          SkillsBox("Recruiting and talent acquisition"),
          SkillsBox("Financial analysis"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  side: BorderSide(width: 2, color: primaryColor)),
              onPressed: () {},
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60.h,
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    "+ Add Skills",
                    style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500),
                  ))),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  SkillsBox(String skillTitle) => Stack(
        children: [
          IntrinsicHeight(
            child: Container(
              //height: 160,
              margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  // color: Colors.amberAccent,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black45))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo company
                  SkillsLogo(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job title
                          Text(
                            skillTitle,
                            style: GoogleFonts.poppins(
                                fontSize: 20.h,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),

// Edit Button
          Positioned(
              right: 10.w,
              child: TextButton(
                  style: TextButton.styleFrom(
                      overlayColor: Colors.red,
                      padding: const EdgeInsets.all(0),
                      side: BorderSide(width: 1, color: Colors.redAccent),
                      backgroundColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    "Remove",
                    style: GoogleFonts.poppins(
                        color: Colors.redAccent, fontSize: 12.h),
                  )))
        ],
      );

  SkillsLogo() => Container(
        height: 50.h,
        width: 50.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.black54)),
        child: Image.asset(
          "assets/images/skill.png",
          color: Colors.black87,
        ),
      );
}
