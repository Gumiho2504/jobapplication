import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/page/profile-page.dart';
import '../model/user.dart';
import '../ui/page/signin-page.dart';
import 'SkillController.dart';


class SkillDropdownScreen extends StatelessWidget {
  final SkillController skillController = Get.put(SkillController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Skills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select a Skill:'),
            Obx(() {
              return DropdownButton<Skill>(
                isExpanded: true,
                hint: Text('Choose Skill'),
                value: skillController.selectedSkill.value,
                items: skillController.skills.map((Skill skill) {
                  return DropdownMenuItem<Skill>(
                    value: skill,
                    child: Text(skill.title),
                  );
                }).toList(),
                onChanged: (Skill? value) {
                  skillController.setSelectedSkill(value);
                },
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (skillController.selectedSkill.value != null) {
                  userProvider.addSkillToUser(userProvider.user.id!, skillController.selectedSkill.value!.id);
                  //Get.to(ProfilePage(user: userProvider.user));
                  Get.back();
                  Get.snackbar('Success', 'Skill added successfully');

                } else {
                  Get.snackbar('Error', 'Please select a skill');
                }
              },
              child: Text('Add Skill'),
            ),
          ],
        ),
      ),
    );
  }
}
