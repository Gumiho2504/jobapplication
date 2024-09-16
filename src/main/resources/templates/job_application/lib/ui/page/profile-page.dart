import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/model/user.dart';
import 'package:job_application/ui/component/profile-page/about-profile.dart';
import 'package:job_application/ui/component/profile-page/education-profile.dart';
import 'package:job_application/ui/component/profile-page/experience-profile.dart';
import 'package:job_application/ui/component/profile-page/skill-profile.dart';
import 'package:job_application/ui/page/explore-page.dart';
import 'package:job_application/ui/page/signin-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../component/profile-page/ProfileForm.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentSelect = 0;
  int activePage = 0;
  final barLabel = ["About", "Experiences", "Educations", "Skills"];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if the profile is null and show the profile form
      if (widget.user.profile == null) {
        showProfileForm(context);
      }
   });
  }

  // Method to show the Profile Form as a bottom sheet
  void showProfileForm(BuildContext context) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // This makes the bottom sheet take full height
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ProfileForm(onSubmit: (title, phoneNumber) {
                // Update the user's profile with the submitted values
               // setState(() {
                  Profile profile =  Profile(
                      title: title,
                      phoneNumber: phoneNumber
                  );
                  userProvider.userAddProfle(widget.user.id!, profile);

              }),
            );
          },
        );
      },
    );
  }
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final page = [
      AboutAtProfile(),
      ExperiencePageView(),
      EducationPageView(),
      SkillsPageView(),
    ];
    return SafeArea(
      child: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                color: const Color(0xFFEFEFEB),
              ),
              Positioned(
                  top: 10,
                  right: 30,
                  child: Row(
                    children: [
                      ExportButton(),
                      SizedBox(
                        width: 10.w,
                      ),
                      EditButton()
                    ],
                  ))
            ],
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
                            "${widget.user.name}",
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
                                "${widget.user.email}",
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
                ),
                Expanded(
                    child: Container(
                  color: backgroundColor,
                  child: PageView.builder(
                      padEnds: false,
                      controller: pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: page.length,
                      onPageChanged: (value) => {
                            setState(() {
                              currentSelect = value;
                              activePage = value;
                            })
                          },
                      itemBuilder: (context, index) => page[index]),
                ))
              ],
            ),
          ),
        ],
      ),
    ).animate()
        .fadeIn(duration: Duration(milliseconds: 1000),curve: Curves.easeInToLinear);
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
                      color:
                          currentSelect == index ? primaryColor : Colors.black,
                      fontSize: currentSelect == index ? 12.h : 10.h,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  setState(() {
                    currentSelect = index;
                    activePage = index;
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
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

  ExportButton() => IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
          decoration: const BoxDecoration(color: backgroundColor, boxShadow: [
            BoxShadow(color: Colors.black87, spreadRadius: 0.1, blurRadius: 0.1)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download_rounded,
                size: 18.h,
              ),
              Text(
                "Export",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 14.h),
              )
            ],
          ),
        ),
      );

  EditButton() => IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
          decoration: const BoxDecoration(color: backgroundColor, boxShadow: [
            BoxShadow(color: Colors.black87, spreadRadius: 0.1, blurRadius: 0.1)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size: 18.h,
              ),
              Text(
                "Edit Profile",
                style:
                    GoogleFonts.poppins(color: Colors.black87, fontSize: 14.h),
              )
            ],
          ),
        ),
      );
}

