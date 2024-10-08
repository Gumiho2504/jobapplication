import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/component/company-logo.dart';
import 'package:job_application/ui/component/profile-page/EducationFormPage.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class EducationPageView extends StatefulWidget {
  const EducationPageView({super.key});

  @override
  State<EducationPageView> createState() => _EducationPageViewState();
}

class _EducationPageViewState extends State<EducationPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Consumer<UserProvider>(builder: (context, userP, child) {
            final User user = userP.user!;
            return Column(
                children: user.profile!.educations! != null &&
                        user.profile!.educations!.isNotEmpty
                    ? List.generate(
                        user.profile!.educations!.length,
                        (index) =>
                            EducationBox(user.profile!.educations![index]))
                    : []);
          }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  side: BorderSide(width: 2, color: primaryColor)),
              onPressed: () {
                Get.to(
                  EducationFormPage(),
                  transition: Transition.fadeIn, // Choose your transition
                  duration:
                      Duration(milliseconds: 600), // Set animation duration
                  curve: Curves.easeInOut, // Set the curve for animation
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60.h,
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    "+ Add Educations",
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

  EducationBox(Education education) => Stack(
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
                  // Education Icon
                  EducationLogo(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Univercity name or school name
                          Text(
                            "${education.school}",
                            style: GoogleFonts.poppins(
                                fontSize: 18.h,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          Row(
                            children: [
                              // company name
                              Text(
                                "${education.field}",
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
                                "${DateFormat('MMM-dd').format(education.startDate)} - ${DateFormat('MMM-dd').format(education.endDate)}",
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
                              "${education.description}",
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
              child: IconButton(
                iconSize: 20.h,
                icon: Icon(Iconsax.edit),
                onPressed: () {
                  Get.to(
                    EducationFormPage(
                      educationData: education,
                    ),
                    transition: Transition.fadeIn, // Choose your transition
                    duration:
                        Duration(milliseconds: 600), // Set animation duration
                    curve: Curves.easeInOut, // Set the curve for animation
                  );
                },
              ))
        ],
      );

  EducationLogo() => Container(
        height: 50.h,
        width: 50.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.black54)),
        child: Image.asset(
          "assets/images/bachelor.png",
          color: Colors.black87,
        ),
      );
}
