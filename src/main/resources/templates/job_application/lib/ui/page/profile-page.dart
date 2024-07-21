import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/page/explore-page.dart';
import 'package:job_application/ui/style/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentSelect = 0;
  int activePage = 0;
  final barLabel = ["About", "Experiences", "Educations", "Skills"];
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 200.h,
            color: Color(0xFFEFEFEB),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 150.h,
                ),

// Profile
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//Profile image
                    Container(
                      width: 100.h,
                      height: 100.h,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black54),
                          color: backgroundColor),
                      child: Icon(
                        CupertinoIcons.profile_circled,
                        size: 80.h,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    Container(
                      // color: Colors.amber,
                      height: 106.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Name
                          Text(
                            "Srak SreyLen",
                            style: headline1,
                          ),
                          // current job
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Iconsax.briefcase,
                                size: 18.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "No current job.",
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          // current location
                          Row(
                            children: [
                              Icon(
                                Iconsax.location,
                                size: 18.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "No Address",
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          // email

                          Row(
                            children: [
                              Icon(
                                Iconsax.sms,
                                size: 18.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "sraksreylen@outlook.com",
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),

// Bar

                Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          barLabel.length, (int) => bar(barLabel[int], int))),
                ),

                Container(
                  height: 1,
                  color: Colors.black87,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  bar(String label, int index) => Expanded(
        child: SizedBox(
          // color: Colors.amber,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(overlayColor: primaryColor),
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: currentSelect == index ? 12.h : 10.h,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  setState(() {
                    currentSelect = index;
                    activePage = index;
                    // pageController.animateToPage(index,
                    //     duration: Duration(milliseconds: 300),
                    //     curve: Curves.bounceInOut);
                  });
                },
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: currentSelect == index ? 3.h : 0,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r))),
              )
            ],
          ),
        ),
      );
}
