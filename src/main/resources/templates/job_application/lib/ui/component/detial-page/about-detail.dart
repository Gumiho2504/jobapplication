import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/style/style.dart';

class AboutDetail extends StatelessWidget {
  const AboutDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// About this jobs
            Text(
              "About this Job",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eismod tempor incididunt ut labore et dolore magna aliqua",
              style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Job Description",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),

            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.square,
                size: 12.h,
                color: primaryColor,
              ),
              title: Text(
                "Lorem ipsum dolor sit amet,consectetur adipiscing elit.",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.square,
                size: 12.h,
                color: primaryColor,
              ),
              title: Text(
                "Sed do eiusmod tempor incididunt ut labore",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.square,
                size: 12.h,
                color: primaryColor,
              ),
              title: Text(
                "Sed do eiusmod tempor incididunt ut labore",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Skills Required",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.square,
                size: 12.h,
                color: primaryColor,
              ),
              title: Text(
                "Technical",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.square,
                size: 12.h,
                color: primaryColor,
              ),
              title: Text(
                "Project Management",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            )
          ],
        ),
      ),
    );
  }
}
