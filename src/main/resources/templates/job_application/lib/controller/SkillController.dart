import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';

class SkillController extends GetxController {
  var skills = <Skill>[].obs;
  var selectedSkill = Rxn<Skill>();

  @override
  void onInit() {
    super.onInit();
    //fetchSkills();
  }

  void fetchSkills() async {
    final response = await http.get(Uri.parse('http://localhost:8080/skill/'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      skills.value = data.map((skill) => Skill.fromJson(skill)).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch skills');
    }
  }

  // Future<List<Skill>> fetchSkills() async {
  //   final response = await http.get(Uri.parse('http://localhost:8080/skill/'));

  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.body) as List;
  //     skills.value = data.map((skill) => Skill.fromJson(skill)).toList();
  //     //List<Skill> skill = skills.value;
  //     return skills;
  //   } else {
  //     Get.snackbar('Error', 'Failed to fetch skills');
  //     return [];
  //   }
  // }

  void setSelectedSkill(Skill? skill) {
    selectedSkill.value = skill;
  }

  void addSkill(Skill skill) {
    // Implement the logic to add the skill to the user's profile
  }
}
