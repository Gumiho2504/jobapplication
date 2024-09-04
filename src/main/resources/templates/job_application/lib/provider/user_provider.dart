

import 'package:flutter/cupertino.dart';
import 'package:job_application/service/user_service.dart';

import '../model/user.dart';

class UserProvider extends ChangeNotifier{
   UserService userService = UserService();
   User? _user;
   bool _isLoading = false;

   User get user => _user!;
   bool get isLoading => _isLoading;
   // Future<void> findUserById(String userName , String password) async {
   //    _isLoading = true;
   //    notifyListeners();
   //    _user = await userService.userLogin(userName,password);
   //    notifyListeners();
   //    _isLoading = false;
   // }

   Future<void> userSignIn(User user) async{
      //isLoading = true;
      //notifyListeners();
      _user = await userService.userSignIn(user);
      notifyListeners();
      //isLoading = false;
   }

   Future<void> userLogin(String email , String password) async {

      _user = await userService.userLogin(email,password);
      notifyListeners();
   }
   

}