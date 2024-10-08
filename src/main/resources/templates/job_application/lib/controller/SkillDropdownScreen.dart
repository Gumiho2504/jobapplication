import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:job_application/ui/page/profile-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../ui/page/signin-page.dart';
import 'SkillController.dart';

class SkillDropdownScreen extends StatefulWidget {
  @override
  State<SkillDropdownScreen> createState() => _SkillDropdownScreenState();
}

class _SkillDropdownScreenState extends State<SkillDropdownScreen> {
  final SkillController skillController = Get.put(SkillController());
  List<Skill> skills = List.empty();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Start");
    someAsyncFunction();
    skillController.skills.clear();
    skillController.selectedSkill.value = null;
    skillController.fetchSkills();
    // final userP = Provider.of<UserProvider>(context, listen: false);
    // if (userP.user!.profile!.skills != null) {
    //   List<Skill> userSkills = userP.user!.profile!.skills!;
    //   print('${userSkills[0].title}');
    //   userSkills.forEach((s) {
    //     skillController.skills.value.remove(s);
    //   });
    // }
  }

  Future<void> someAsyncFunction() async {
    // Now you can use the skills list here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            style: IconButton.styleFrom(
                padding: EdgeInsets.all(10.h),
                backgroundColor: Colors.transparent,
                side: const BorderSide(width: 0.01, color: Colors.transparent)),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Iconsax.arrow_left,
              color: Colors.white,
            )),
        backgroundColor: primaryColor,
        title: Text(
          'Add Skills',
          style: GoogleFonts.poppins(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 26.h),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Skill:',
              style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.h),
            ),
            Obx(() {
              if (skillController.skills.isEmpty) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show loading if skills are not yet loaded
              } else {
                final userP = Provider.of<UserProvider>(context, listen: false);
                if (userP.user!.profile!.skills != null) {
                  List<Skill> userSkills = userP.user!.profile!.skills!;
                  print('${userSkills[0].title}');
                  userSkills.forEach((s) {
                    skillController.skills
                        .removeWhere((skill) => skill.id == s.id);
                  });
                }
                return Container(
                  height: 60.h,
                  // width: 500,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(5.h),
                      border: Border.all(width: 1, color: primaryColor)),
                  margin: EdgeInsets.only(top: 10.h),
                  child: DropdownButton2<Skill>(
                    dropdownStyleData: DropdownStyleData(
                      // maxHeight: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFFFFFFF),
                      ),
                      offset: const Offset(0, 8),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                        height: 50.h,
                        padding: EdgeInsets.only(
                            top: 10.h, left: 20.w, right: 20.w)),
                    isExpanded: true,
                    style: GoogleFonts.poppins(
                        fontSize: 16.h, color: primaryColor),
                    hint: Text(
                      'Choose Skill',
                      style: GoogleFonts.poppins(),
                    ),
                    //dropdownColor: backgroundColor,
                    value: skillController.selectedSkill.value,
                    items: skillController.skills.map((Skill skill) {
                      return DropdownMenuItem<Skill>(
                          value: skill,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(skill.title));
                    }).toList(),
                    onChanged: (Skill? value) {
                      print("change");
                      skillController.setSelectedSkill(value);
                    },
                    iconStyleData: IconStyleData(
                        iconSize: 28.h,
                        iconEnabledColor: primaryColor,
                        iconDisabledColor: Colors.grey),
                  ),
                );
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    side: BorderSide(width: 2, color: primaryColor)),
                onPressed: () {
                  final userP =
                      Provider.of<UserProvider>(context, listen: false);
                  if (skillController.selectedSkill.value != null) {
                    userP.addSkillToUser(userP.user.id!,
                        skillController.selectedSkill.value!.id);
                    //Get.to(ProfilePage(user: userProvider.user));
                    Get.back();
                    Get.snackbar('Success', 'Skill added successfully');
                  } else {
                    Get.snackbar('Error', 'Please select a skill');
                  }
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
          ],
        ),
      ),
    );
  }
}
