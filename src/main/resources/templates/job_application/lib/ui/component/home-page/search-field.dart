import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/style/style.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50.h,
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: 0.5, color: primaryColor),
          borderRadius: BorderRadius.circular(5.r)),
      child: Center(
        child: TextField(
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.h),
            decoration: InputDecoration(
                icon: Icon(
                  Iconsax.search_normal,
                  color: secondaryColors,
                  size: 25.h,
                ),
                border: InputBorder.none,
                hintText: "Search Jobs",
                hintStyle: GoogleFonts.poppins(
                    color: secondAccentColors, fontSize: 17.h))),
      ),
    );
  }
}
