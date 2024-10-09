import 'package:flutter/cupertino.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/service/user_service.dart';

import '../model/user.dart';

class UserProvider extends ChangeNotifier {
  UserService userService = UserService();
  User? _user;
  //List<Job>? _saveJob;
  bool _isLoading = false;

  User get user => _user!;
  //List<Job> get saveJob => _saveJob!;
  bool get isLoading => _isLoading;

  Future<void> findUserById(int id) async {
    _isLoading = true;
    notifyListeners();
    _user = await userService.getUserById(id);
    notifyListeners();
    _isLoading = false;
  }

  Future<void> userSignIn(User user) async {
    //isLoading = true;
    //notifyListeners();
    _user = await userService.userSignIn(user);
    notifyListeners();
    //isLoading = false;
  }

  Future<void> userLogin(String email, String password) async {
    _user = await userService.userLogin(email, password);
    notifyListeners();
  }

  Future<void> addJobToUser(int userId, int jobId) async {
    _user = await userService.addJobToUser(userId, jobId);
    print("add");

    print(_user!.name);

    notifyListeners();
  }

  Future<void> removeJobFromUser(int userId, int jobId) async {
    _user = await userService.removeJobFromUser(userId, jobId);
    print("removed");
    _user?.saveJobs?.forEach((j) {
      print(j.title);
    });
    notifyListeners();
  }

  Future<void> addSkillToUser(int userId, int skillId) async {
    _user = await userService.addSkillToUser(userId, skillId);
    notifyListeners();
  }

  Future<void> deletedSkillFromUser(int userId, int skillId) async {
    _user = await userService.removeSkillFromUser(userId, skillId);
    notifyListeners();
  }

  Future<void> userAddProfile(int userId, Profile profile) async {
    _user = await userService.addProfileToUser(userId, profile);
    notifyListeners();
  }

  Future<void> userPostEducation(int id, Education education) async {
    _user = await userService.userPostEducation(id, education);
    notifyListeners();
  }

  Future<void> userEditEducation(
      int userId, int educationId, Education education) async {
    _user = await userService.userEditEducation(userId, educationId, education);
    notifyListeners();
  }

  Future<void> userDeleteEducation(int userId, int educationId) async {
    _user = await userService.userDeleteEducation(userId, educationId);
    notifyListeners();
  }
  // experience

  Future<void> userPostExperience(int id, Experience experience) async {
    _user = await userService.userPostExperience(id, experience);
    notifyListeners();
  }

  Future<void> userUpdateExperience(
      int userId, int experienceId, Experience experience) async {
    _user =
        await userService.userEditExperience(userId, experienceId, experience);
    notifyListeners();
  }

  Future<void> userDeleteExperience(int userId, int experienceId) async {
    _user = await userService.userDeleteExperience(userId, experienceId);
    notifyListeners();
  }
}
