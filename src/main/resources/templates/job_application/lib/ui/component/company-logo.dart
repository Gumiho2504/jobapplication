import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/style/style.dart';

companyLogoBox() => Container(
      alignment: Alignment.center,
      height: 50.h,
      width: 50.h,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(6)),
      child: Text(
        "B.",
        style: GoogleFonts.poppins(
            color: backgroundColor, fontSize: 28, fontWeight: FontWeight.w700),
      ),
    );
