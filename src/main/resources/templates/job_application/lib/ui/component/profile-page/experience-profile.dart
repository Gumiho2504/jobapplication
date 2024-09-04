import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/component/company-logo.dart';
import 'package:job_application/ui/style/style.dart';

class ExperiencePageView extends StatefulWidget {
  const ExperiencePageView({super.key});

  @override
  State<ExperiencePageView> createState() => _ExperiencePageViewState();
}

class _ExperiencePageViewState extends State<ExperiencePageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          ExperienceBox(),
          ExperienceBox(),
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
                    "+ Add Experiences",
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

  ExperienceBox() => Stack(
        children: [
          IntrinsicHeight(
            child: Container(
              //height: 160,
              margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.only(bottom: 20.h),
              decoration: const BoxDecoration(
                  // color: Colors.amberAccent,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black45))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo company
                  companyLogoBox(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job title
                          Text(
                            "UI/UX Desinger",
                            style: GoogleFonts.poppins(
                                fontSize: 20.h,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          Row(
                            children: [
                              // company name
                              Text(
                                "AJIB Cltd",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black45),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "|",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black45),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),

                              // start date and end date

                              Text(
                                "Feb 2018 - Now",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.h,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black45),
                              ),
                            ],
                          ),
                          // description
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(top: 5.h, right: 20.w),
                            //color: Colors.amber,
                            child: Text(
                              "user-friendly interfaces for web and mobile applications. Skilled in leveraging design principles and user-centered methodologies to deliver high-quality, visually appealing products.",
                              style: GoogleFonts.poppins(
                                  fontSize: 13.h, fontWeight: FontWeight.w400),
                            ),
                          ))
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
                      padding: EdgeInsets.all(0),
                      side: BorderSide(width: 1, color: Colors.black12),
                      backgroundColor: Colors.transparent),
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: GoogleFonts.poppins(
                        color: Colors.black26, fontSize: 12.h),
                  )))
        ],
      );
}
