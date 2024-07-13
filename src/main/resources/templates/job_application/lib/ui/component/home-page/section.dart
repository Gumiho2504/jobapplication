import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/style/style.dart';

section(String title) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: headline3_black,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style:
                    GoogleFonts.poppins(fontSize: 15.h, color: secondaryColors),
              ))
        ],
      ),
    );
