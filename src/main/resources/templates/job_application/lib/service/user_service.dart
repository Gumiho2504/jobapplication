import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_application/ui/page/signin-page.dart';

import '../model/user.dart';

class UserService {
   static const String baseUrl = "http://localhost:8080/api/user";

   // Future<User> userLogin (String userName , String password) async {
   //    final res = await http.get(Uri.parse(baseUrl));
   //    if(res.statusCode == 200){
   //       return User.fromJson(jsonDecode(res.body));
   //    }else{
   //       throw Exception("User Not fond!");
   //    }
   // }

   Future<User> userSignIn(User user) async{
      final res = await http.post(
          Uri.parse(baseUrl+"/register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user.toJson()),
      );
      print("${user.name} | ${user.email} | ${user.password}");
      print("post - ${res.statusCode}");
      if(res.statusCode == 201){
         print("body - ${res.body}");
         User u = User.fromJson(jsonDecode(res.body));
         print(  " savejob - ${  u.saveJobs!.length}");
         return User.fromJson(jsonDecode(res.body));
      }else{
         throw Exception("field to create user ");
      }
   }
   
   Future<User> userLogin (String email,String password) async{
      final res = await http.post(
          Uri.parse(baseUrl+"/login"),
         headers: {'Content-Type' : 'application/json'},
         body: jsonEncode({
            'email': email,
            'password': password,
         }),
      );

      if(res.statusCode == 200){
         print("login + ${res.body}");
         User u = User.fromJson(jsonDecode(res.body));
         print(  " savejob - ${  u.saveJobs!.length}");
         return User.fromJson(jsonDecode(res.body));
      }else{
         throw Exception("field to login!");
      }
      
   }

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

            // Safely check if `saveJobs` is not null
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
         // Add more detailed error logging
         print("Error occurred: $error");
         throw Exception("An error occurred while saving the job: $error");
      }
   }



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

}