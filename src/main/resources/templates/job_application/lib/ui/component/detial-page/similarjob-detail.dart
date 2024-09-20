import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:job_application/ui/style/style.dart';

class SimilarJobDetial extends StatelessWidget {
  const SimilarJobDetial({super.key});

  @override
  Widget build(BuildContext context) {
    final Job similarJob = Job(id: 9, title: "dfff");
    return Container(
        child: SingleChildScrollView(
      child: Column(
          children: List.generate(
        3,
        (int) => Container(
          height: 80.h,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: primaryColor, width: 1))),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => JobDetailPage(job: similarJob,isBookMark: false,)));
            },
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              "Poster Disgner",
              style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "AWS Disiger Company",
              style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400),
            ),
            trailing: Text(
              "Full-Time",
              style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 14.h,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      )),
    ));
  }
}
