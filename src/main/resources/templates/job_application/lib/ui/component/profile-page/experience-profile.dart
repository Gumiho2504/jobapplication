import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/component/company-logo.dart';
import 'package:job_application/ui/component/profile-page/ExperienceFormScreen.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class ExperiencePageView extends StatefulWidget {
  const ExperiencePageView({super.key});

  @override
  State<ExperiencePageView> createState() => _ExperiencePageViewState();
}

class _ExperiencePageViewState extends State<ExperiencePageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<UserProvider>(builder: (context, userP, _) {
        final User user = userP.user!;
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: userP.user.profile!.experiences! != null &&
                      userP.user.profile!.experiences!.isNotEmpty
                  ? List.generate(
                      user.profile!.experiences!.length,
                      (index) =>
                          ExperienceBox(user.profile!.experiences![index]))
                  : [],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    side: BorderSide(width: 2, color: primaryColor)),
                onPressed: () {
                  Get.to(ExperienceFormScreen(),
                      transition: Transition.downToUp,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeIn);
                },
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
        );
      }),
    );
  }

  ExperienceBox(Experience experience) => Stack(
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
                            "${experience.title}",
                            style: GoogleFonts.poppins(
                                fontSize: 20.h,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          Row(
                            children: [
                              // company name
                              Text(
                                "${experience.company}",
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
                                "${DateFormat('MMM-dd').format(experience.startDate)} - ${DateFormat('MMM-dd').format(experience.endDate)}",
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
                              "${experience.description}",
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
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                // Navigate to the ExperienceFormScreen to edit the experience data
                Get.to(ExperienceFormScreen(experienceData: experience));
              },
              onLongPress: () {
                // Show a confirmation dialog before deleting
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Delete Experience"),
                      content: Text(
                          "Are you sure you want to delete this experience?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Dismiss the dialog
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Perform delete operation here (implement your delete logic)
                            final userP = Provider.of<UserProvider>(context,
                                listen: false);
                            await userP.userDeleteExperience(
                                userP.user.id!, experience.id!);
                            Get.snackbar("Success", "experiece delete");
                            print("Experience deleted");

                            // Dismiss the dialog after deletion
                            Navigator.of(context).pop();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Edit",
                style: GoogleFonts.poppins(
                  color: Colors.black26,
                  fontSize: 12.h,
                ),
              ),
            ),
          )
        ],
      );
}
