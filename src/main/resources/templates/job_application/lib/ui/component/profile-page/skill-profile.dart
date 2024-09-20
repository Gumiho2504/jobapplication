import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/controller/SkillDropdownScreen.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/page/signin-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class SkillsPageView extends StatefulWidget {
  //final List<Skill> skills;
  const SkillsPageView({super.key});

  @override
  State<SkillsPageView> createState() => _SkillsPageViewState();
}

class _SkillsPageViewState extends State<SkillsPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Consumer<UserProvider>(
            builder: (context,userP,child) {
              final User user = userP.user!;
              return Column(
                children: user.profile?.skills != null && user.profile!.skills!.isNotEmpty
                    ? List.generate(user.profile!.skills!.length, (index) {
                  final skill = user.profile!.skills![index];
                  return SkillsBox(skill);
                })
                    : [Text('No skills available')],
              );
            }
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundColor,
                  side: BorderSide(width: 2, color: primaryColor)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SkillDropdownScreen()));
              },
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 60.h,
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    "+ Add Skills",
                    style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: 18.h,
                        fontWeight: FontWeight.w500),
                  ))),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  SkillsBox(Skill skill) => Stack(
        children: [
          IntrinsicHeight(
            child: Container(
              //height: 160,
              margin: EdgeInsets.only(bottom: 15.h),
              padding: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  // color: Colors.amberAccent,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black45))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo company
                  SkillsLogo(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job title
                          Text(
                            skill.title,
                            style: GoogleFonts.poppins(
                                fontSize: 20.h,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),

// Edit Button
          Positioned(
              right: 10.w,
              child: TextButton(
                  style: TextButton.styleFrom(
                      overlayColor: Colors.red,
                      padding: const EdgeInsets.all(0),
                      side: BorderSide(width: 1, color: Colors.redAccent),
                      backgroundColor: Colors.transparent),
                  onPressed: () {
                    final userP = Provider.of<UserProvider>(context,listen: false);
                    print("${skill.id}-${userP.user.id!}");
                    userP.deletedSkillFromUser(userP.user.id!, skill.id);
                    // setState(() {
                    //   //widget.skills.remove(skill);
                    // });

                  },
                  child: Text(
                    "Remove",
                    style: GoogleFonts.poppins(
                        color: Colors.redAccent, fontSize: 12.h),
                  )))
        ],
      );

  SkillsLogo() => Container(
        height: 50.h,
        width: 50.h,
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.h),
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.black54)),
        child: Image.asset(
          "assets/images/skill.png",
          color: Colors.black87,
        ),
      );
}
