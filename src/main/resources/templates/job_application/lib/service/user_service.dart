import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class UserService {
  static const String baseUrl = "http://localhost:8080/api/user";

  // Sign in User
  Future<User> userSignIn(User user) async {
    final res = await http.post(
      Uri.parse(baseUrl + "/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );
    print("${user.name} | ${user.email} | ${user.password}");
    print("post - ${res.statusCode}");
    if (res.statusCode == 201) {
      print("body - ${res.body}");
      User u = User.fromJson(jsonDecode(res.body));
      print("savejob - ${u.saveJobs!.length}");
      return u;
    } else {
      throw Exception("Failed to create user");
    }
  }

  // Future<User> getUserById(int id) async {
  //   final res = await http.get(Uri.parse("$baseUrl/$id"));
  //   if (res.statusCode == 200) {
  //     final body = res.body;
  //     return User.fromJson(jsonDecode(body));
  //   } else {
  //     throw Exception("user not found");
  //   }
  // }

  // User Login
  Future<User> userLogin(String email, String password) async {
    final res = await http.post(
      Uri.parse(baseUrl + "/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      print("login + ${res.body}");
      User u = User.fromJson(jsonDecode(res.body));
      print("savejob - ${u.saveJobs!.length}");
      return u;
    } else {
      throw Exception("Failed to login!");
    }
  }

  // Add job to user
  Future<User> addJobToUser(int userId, int jobId) async {
    final url = Uri.parse("$baseUrl/$userId/savejob=$jobId");

    try {
      final response = await http.post(url);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);

        // Deserialize the user data into a User object
        User user = User.fromJson(userData);

        if (user.saveJobs != null) {
          print("savejob - ${user.saveJobs!.length}");
        } else {
          print("No jobs saved.");
        }

        return user;
      } else if (response.statusCode == 404) {
        throw Exception("User not found");
      } else {
        throw Exception(
            "Failed to save job to user. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error occurred: $error");
      throw Exception("An error occurred while saving the job: $error");
    }
  }

  // Remove job from user
  Future<User> removeJobFromUser(int userId, int jobId) async {
    final url = Uri.parse('$baseUrl/$userId/removejob=$jobId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        return User.fromJson(userData);
      } else if (response.statusCode == 404) {
        throw Exception('User or job not found');
      } else {
        throw Exception(
            'Failed to remove job from user. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error removing job from user: $e");
      throw Exception('An error occurred while removing the job: $e');
    }
  }

  // Add profile
  Future<User> addProfileToUser(int userId, Profile profile) async {
    final url = Uri.parse("$baseUrl/profile/$userId");
    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(profile.toJson()),
      );
      if (res.statusCode == 201) {
        final body = json.decode(res.body);
        return User.fromJson(body);
      } else {
        throw Exception(
            'Failed to add profile to user. Status Code: ${res.statusCode}');
      }
    } catch (e) {
      print("Error adding skill to user: $e");
      throw Exception('An error occurred while adding the skill: $e');
    }
  }

  // Add skill to user
  Future<User> addSkillToUser(int userId, int skillId) async {
    final url = Uri.parse("$baseUrl/$userId/skill/$skillId");

    try {
      final response = await http.post(url);

      if (response.statusCode == 202) {
        final userData = json.decode(response.body);
        return User.fromJson(userData);
      } else if (response.statusCode == 404) {
        throw Exception('User or skill not found');
      } else {
        throw Exception(
            'Failed to add skill to user. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error adding skill to user: $e");
      throw Exception('An error occurred while adding the skill: $e');
    }
  }

  // Remove skill from user
  Future<User> removeSkillFromUser(int userId, int skillId) async {
    final url = Uri.parse("$baseUrl/$userId/skill/$skillId");

    try {
      final response = await http.delete(url);

      if (response.statusCode == 202) {
        final userData = json.decode(response.body);
        return User.fromJson(userData);
      } else if (response.statusCode == 404) {
        throw Exception('User or skill not found');
      } else {
        throw Exception(
            'Failed to remove skill from user. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error removing skill from user: $e");
      throw Exception('An error occurred while removing the skill: $e');
    }
  }

  // education

  Future<User> userPostEducation(int id, Education education) async {
    final url = Uri.parse("$baseUrl/$id/education/post");
    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(education.toJson()),
      );
      if (res.statusCode == 201) {
        final body = res.body;
        return User.fromJson(jsonDecode(body));
      } else {
        throw Exception(
            'Failed to remove skill from user. Status Code: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred while post the education: $e');
    }
  }

  Future<User> getUserById(int id) async {
    final url = Uri.parse("$baseUrl/$id");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final body = res.body;
        return User.fromJson(jsonDecode(body));
      } else {
        throw Exception('Failed to get user Status Code: ${res.statusCode}');
      }
    } catch (e) {
      throw Exception("an error to get user $e");
    }
  }

  Future<User> userEditEducation(
      int userId, int educationId, Education education) async {
    final url = Uri.parse("http://localhost:8080/education/id=$educationId");
    try {
      final res = await http.put(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(education.toJson()));
      if (res.statusCode == 200) {
        final body = res.body;
        print("editd -  $body");
      } else {
        throw Exception("failed to edit education");
      }
    } catch (e) {
      throw Exception("error at edit education :  $e");
    }
    return await getUserById(userId);
  }

  Future<User> userDeleteEducation(int userId, int educationId) async {
    final url = Uri.parse("http://localhost:8080/education/id=$educationId");
    final res = await http.delete(url);
    if (res.statusCode == 202) {
      print("success! education deleted !");
    } else {
      print("failed to delete education");
    }
    return await getUserById(userId);
  }
  // experience

  Future<User> userPostExperience(int id, Experience experience) async {
    final url = Uri.parse("$baseUrl/$id/experience/post");
    try {
      final res = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(experience.toJson()));
      if (res.statusCode == 201) {
        final body = res.body;
        return User.fromJson(jsonDecode(body));
      } else {
        throw Exception("failed to post experience !");
      }
    } catch (e) {
      throw Exception("error at post experience : $e");
    }
  }

  ///experience
  Future<User> userEditExperience(
      int userId, int experienceId, Experience experience) async {
    final url = Uri.parse("http://localhost:8080/experience/id=$experienceId");
    try {
      final res = await http.put(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(experience.toJson()));
      if (res.statusCode == 202) {
        final body = res.body;
        print('new experience update : $body');
      } else {
        throw Exception("failed to update experience !");
      }
    } catch (e) {
      throw Exception("error : $e");
    }
    return await getUserById(userId);
  }

  Future<User> userDeleteExperience(int userId, int experienceId) async {
    final url = Uri.parse("http://localhost:8080/experience/id=$experienceId");
    try {
      final res = await http.delete(url);
      if (res.statusCode == 202) {
        print("success to delete experience");
      } else {
        print("failed to deleted experience");
      }
    } catch (e) {
      throw Exception("erorr : $e");
    }
    return await getUserById(userId);
  }
}
