import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:job_application/model/job.dart';
import 'package:job_application/ui/style/style.dart';

class CompanyAtDetail extends StatelessWidget {
  final Company company;
  const CompanyAtDetail({
    Key? key,
    required this.company,
  }) : super(key: key);

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
              "${company.description}",
              style: GoogleFonts.poppins(color: Colors.black87, fontSize: 13.h),
            ),
            SizedBox(
              height: 10.h,
            ),
// information

            Text(
              "Information",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500),
            ),

            Column(
              children: List.generate(
                company.informations.length,
                (index) => ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: Icon(
                    Icons.circle,
                    size: 12.h,
                  ),
                  title: Text(
                    "${company.informations[index].information}",
                    style: GoogleFonts.poppins(
                        color: Colors.black87, fontSize: 13.h),
                  ),
                ),
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
                "+${company.phoneNumber}",
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
                "${company.email}",
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
