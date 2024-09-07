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
      if(res.statusCode == 200){
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
         return User.fromJson(jsonDecode(res.body));
      }else{
         throw Exception("field to login!");
      }
      
   }

   Future<User> addJobToUser(int userId, int jobId) async {
      final url = Uri.parse("$baseUrl/$userId/savejob=$jobId");

      try {
         final response = await http.post(url);

         if (response.statusCode == 200) {
            // If the response is successful, you can parse the user data here if needed.
            final user = jsonDecode(response.body);
            return User.fromJson(user);
            print('Job saved successfully for User: $user');

            // Update your provider's state here if necessary
            // For example, notifyListeners();
         } else if (response.statusCode == 404) {
            throw Exception("User not found");
            // Handle user not found
            print("User not found");
         } else {
            // Handle other errors
            throw Exception("Failed to save job to user. Status code: ${response.statusCode}");
            print("Failed to save job to user. Status code: ${response.statusCode}");
         }

      } catch (error) {
         throw Exception(error);
         print("Error occurred: $error");
      }
   }


   Future<User> removeJobFromUser(int userId, int jobId) async {
      final url = Uri.parse('$baseUrl/$userId/removejob=$jobId');

      try {
         final response = await http.delete(url);

         if (response.statusCode == 200) {
            // Successfully removed job from user
            final userData = json.decode(response.body);

            // Return the User object parsed from the JSON response
            return User.fromJson(userData);
         } else if (response.statusCode == 404) {
            // Handle the case when the user or job is not found
            throw Exception('User or job not found');
         } else {
            // Handle other status codes appropriately
            throw Exception('Failed to remove job from user. Status Code: ${response.statusCode}');
         }
      } catch (e) {
         // Log and rethrow the exception to handle it higher up in the UI
         print("Error removing job from user: $e");
         throw Exception('An error occurred while removing the job: $e');
      }
   }

}