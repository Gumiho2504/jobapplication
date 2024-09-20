import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:job_application/ui/style/style.dart';

import '../../../model/job.dart';

class JobBookMarkBox extends StatefulWidget {
  final Job job;
  const JobBookMarkBox({super.key,required this.job});

  @override
  State<JobBookMarkBox> createState() => _JobBookMarkBoxState();
}

class _JobBookMarkBoxState extends State<JobBookMarkBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => JobDetailPage(job: widget.job,isBookMark: true,)));
      },
      child: Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: const BoxDecoration(
            border: Border(
          top: BorderSide(width: 1, color: Color(0xFF607EE0)),
        )),
        child: Row(
          children: [
            profile("${widget.job.title[0]}.", primaryColor),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Container(
                //color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Job Title
                        Text(
                          "${widget.job.title}",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18.h,
                              fontWeight: FontWeight.w500),
                        ),
                        // Company name
                        Text(
                          "Amazon cltd",
                          style: GoogleFonts.poppins(
                              color: Colors.black87,
                              fontSize: 14.h,
                              fontWeight: FontWeight.w500),
                        ),
                        // location
                        Text(
                          "UI UX Designer",
                          style: GoogleFonts.poppins(
                              color: Colors.black45,
                              fontSize: 12.h,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Icon(
                      Iconsax.bookmark_21,
                      size: 50.h,
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  profile(String name, Color c) => CircleAvatar(
        radius: 35.h,
        backgroundColor: c,
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
                color: backgroundColor,
                fontSize: 60.h,
                fontWeight: FontWeight.w700),
          ),
        ),
      );
}
