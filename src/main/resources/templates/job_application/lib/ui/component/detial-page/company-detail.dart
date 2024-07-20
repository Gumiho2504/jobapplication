import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/style/style.dart';

class CompanyAtDetail extends StatelessWidget {
  const CompanyAtDetail({super.key});

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
              "About this Company",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "WHO WE ARE AJIP CONSULTING is an executive search and human resources consulting firm in Cambodia. Our consultants are highly specialized and have extensive experiences in the industries and areas in which they serve.WHAT WE DO We strive to deliver solutions with speed and quality that make a massive impact for our clients. At present, Ajip is focused on providing unrivaled recruitment services that meet our clients' permanent and short-term needs, delivering mid- to senior-level professional talents across all industry segments in Cambodia.WHERE WE'RE GOING.Our vision is to be the leading HR Consulting, HR Technology Solutions, and Specialist Recruitment group in Cambodia.",
              style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Information",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),

            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Icons.circle,
                size: 12.h,
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
                Icons.circle,
                size: 12.h,
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
              "Contact Us",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),

            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Iconsax.call,
                size: 15.h,
              ),
              title: Text(
                "+855 86937183",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: Icon(
                Iconsax.sms,
                size: 15.h,
              ),
              title: Text(
                "vta@outlook.com",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
