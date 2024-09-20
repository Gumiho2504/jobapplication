import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/provider/job_provider.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:job_application/ui/page/signin-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class JobBox extends StatefulWidget {
  final Job job;
  const JobBox({super.key, required this.job});

  @override
  State<JobBox> createState() => _JobBoxState();
}

class _JobBoxState extends State<JobBox> {
  bool isBookMark = false;

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(
      context,
      designSize: Size(430, 932),
    );
    return jobBox(context);
  }

  jobBox(BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => JobDetailPage(job: widget.job,isBookMark: isBookMark,)));
      },
      child: Consumer<UserProvider>(builder: (context, _userProvider, child){

        User user = _userProvider.user!;
        isBookMark = user.saveJobs!.any((j) => j.id == widget.job.id);
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 20),
          height: 216.h,
          width: 300.w,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: darkAccentcolor.withOpacity(0.4),
                    spreadRadius: 0.1,
                    offset: Offset.zero,
                    blurRadius: 0.1,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      companyLogoBox(),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //job title
                          Container(
                            width: 171.w,
                            height: 26.h,
                            //color: Colors.amber,
                            child: Text(
                              "${widget.job.title}",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.h),

                            ),
                          ),
                          Text(
                            "Briosous Solution",
                            style: GoogleFonts.poppins(
                                color: secondAccentColors,
                                fontSize: 12.h,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),

                  // BookMark Button

                  IconButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        final _userProvider = Provider.of<UserProvider>(context, listen: false);
                        setState(() {
                          isBookMark = !isBookMark;
                          if (isBookMark) {
                            _userProvider.addJobToUser(_userProvider.user!.id!, widget.job.id);
                          } else {
                            _userProvider.removeJobFromUser(_userProvider.user!.id!, widget.job.id);
                          }
                        });
                      },
                      iconSize: 30.h,
                      icon: Icon(
                        Iconsax.save_21,
                        color: isBookMark ? primaryColor : secondAccentColors,
                      ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              // Job location

              Row(
                children: [
                  Icon(
                    Iconsax.location5,
                    color: primaryColor,
                    size: 20.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Phnom Penh , Kh",
                    style: GoogleFonts.poppins(
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400,
                        color: darkAccentcolor),
                  )
                ],
              ),

              SizedBox(
                height: 10.h,
              ),

              // Detail of Job

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [box("Full-time"), box("Remote"), box("Internship")],
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                height: 1.h,
                color: secondAccentColors.withOpacity(0.2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //View

                  Container(
                    width: 100.w,
                    height: 40.h,
                    //color: Colors.amber,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: profileView("T", Color(0xFF07DEFF)),
                        ),
                        Positioned(
                          left: 15,
                          child: profileView("A", primaryColor),
                        ),
                        Positioned(
                          left: 30,
                          child: profileView("N", Color(0xFFFD7FEC)),
                        ),
                        Positioned(
                          left: 45,
                          child: profileView("G", Color(0xFF7FFDB1)),
                        ),
                        Positioned(
                          left: 60,
                          child: profileView(
                              "+", Color.fromARGB(255, 228, 225, 227)),
                        ),
                      ],
                    ),
                  ),

                  // Salary
                  Row(
                    children: [
                      Text(
                        "\$1K-\$3K",
                        style: headline2_black,
                      ),
                      Text(
                        " /month",
                        style: bodyText2,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      })

  );

  companyLogoBox() => Container(
    alignment: Alignment.center,
    height: 50.h,
    width: 50.h,
    decoration: BoxDecoration(
        color: primaryColor, borderRadius: BorderRadius.circular(6)),
    child: Text(
      "${widget.job.title[0]}.",
      style: GoogleFonts.poppins(
          color: backgroundColor,
          fontSize: 28,
          fontWeight: FontWeight.w700),
    ),
  );

  box(String title) {
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
            color: secondAccentColors.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(10.h),
        child: Text(
          title,
          style:
          GoogleFonts.poppins(fontSize: 12.h, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  profileView(String name, Color c) => CircleAvatar(
    maxRadius: 15.h,
    backgroundColor: c,
    child: Center(
      child: Text(
        name,
        style: GoogleFonts.poppins(color: Colors.white),
      ),
    ),
  );
}
