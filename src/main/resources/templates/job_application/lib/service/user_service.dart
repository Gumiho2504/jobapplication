import 'dart:convert';
import 'package:http/http.dart' as http;

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
}