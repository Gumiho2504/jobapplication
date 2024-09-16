import 'dart:convert';
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
            throw Exception("Failed to save job to user. Status code: ${response.statusCode}");
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
            throw Exception('Failed to remove job from user. Status Code: ${response.statusCode}');
         }
      } catch (e) {
         print("Error removing job from user: $e");
         throw Exception('An error occurred while removing the job: $e');
      }
   }

   // Add profile
   Future<User> addProfileToUser(int userId, Profile profile) async {
      final url = Uri.parse("$baseUrl/profile/$userId");
      try{
         final res = await http.post(
             url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(profile.toJson()),
         );
         if(res.statusCode == 201){
            final body = json.decode(res.body);
            return User.fromJson(body);
         }else {
            throw Exception('Failed to add profile to user. Status Code: ${res.statusCode}');
         }
      }catch(e){
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
            throw Exception('Failed to add skill to user. Status Code: ${response.statusCode}');
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
            throw Exception('Failed to remove skill from user. Status Code: ${response.statusCode}');
         }
      } catch (e) {
         print("Error removing skill from user: $e");
         throw Exception('An error occurred while removing the skill: $e');
      }
   }
}
