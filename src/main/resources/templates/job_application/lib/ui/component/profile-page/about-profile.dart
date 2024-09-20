import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class AboutAtProfile extends StatelessWidget {
  const AboutAtProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context,_userP,child) {
        final User user = _userP.user!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            user.profile != null  ?
            Text(
              "${user.profile!.title}",
              style: GoogleFonts.poppins(
                  fontSize: 14.h,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ) : Text("")
          ],
        );
      }
    );
  }
}
