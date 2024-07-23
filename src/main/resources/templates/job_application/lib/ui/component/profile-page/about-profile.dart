import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/style/style.dart';

class AboutAtProfile extends StatelessWidget {
  const AboutAtProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "About",
              style: headline2_black,
            ),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.edit))
          ],
        ),
        SizedBox(
          height: 0.h,
        ),
        Text(
          "Creative and detail-oriented UI Designer with [X] years of experience in creating engaging, user-friendly interfaces for web and mobile applications. Skilled in leveraging design principles and user-centered methodologies to deliver high-quality, visually appealing products. Proficient in modern design tools and passionate about continuous learning and improvement.",
          style: GoogleFonts.poppins(
              fontSize: 14.h,
              fontWeight: FontWeight.w400,
              color: Colors.black87),
        )
      ],
    );
  }
}
