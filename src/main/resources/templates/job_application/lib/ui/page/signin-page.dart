import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/model/user.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/page/home-page.dart';
import 'package:job_application/ui/page/joblist-page.dart';
import 'package:job_application/ui/page/login-page.dart';
import 'package:job_application/ui/page/profile-page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigationController.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userName = TextEditingController();
  final passwords = TextEditingController();
  final email = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    final UserProvider userP = Provider.of<UserProvider>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            Container(
              color: Colors.deepOrange,
              width: double.infinity,
              height: 400.h,
              child: Image.asset(
                "assets/images/find.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            //Username Inputfield

            Container(
              height: 70.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF08406E),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.h),
                controller: userName,
                decoration: InputDecoration(
                    icon: const Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    hintText: "Username",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.7), fontSize: 16.h),
                    border: InputBorder.none,
                    fillColor: Colors.blue),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "username is require ";
                  }
                  return null;
                },
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // Passworld Inputfield

            Container(
              height: 70.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 8, 64, 110),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.h),
                controller: passwords,
                obscureText: isShow,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: Icon(
                        isShow ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    icon: const Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    hintText: "Passwords",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.7), fontSize: 16.h),
                    border: InputBorder.none,
                    fillColor: Colors.blue),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "password is require ";
                  }
                  return null;
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),

            // Passworld Inputfield

            Container(
              height: 70.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 8, 64, 110),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.h),
                controller: email,
                obscureText: isShow,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isShow = !isShow;
                        });
                      },
                      icon: Icon(
                        isShow ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    icon: const Icon(
                      CupertinoIcons.person,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    hintText: "Email",
                    hintStyle: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.7), fontSize: 16.h),
                    border: InputBorder.none,
                    fillColor: Colors.blue),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email is require ";
                  }
                  // else if (passwords.text != email.text) {
                  //   return "password not matches ";
                  // }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () async {
                  if (_keyForm.currentState!.validate()) {
                    String name = userName.text;
                    String _email = email.text;
                    String _password = passwords.text;

                    User user = User(
                        id: null,
                        name: name,
                        email: _email,
                        password: _password,
                        saveJobs: []);
                    print("${user.name} | ${user.email} | ${user.password}");
                    try {
                      await userP.userSignIn(user);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      int userId = userP.user.id!;
                      await prefs.setBool('isLoggedIn', true);
                      await prefs.setInt('userId', userId);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NavigetionPage()));
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Failed to signin'),
                      ));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 16, 16, 146),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.w, vertical: 15),
                    textStyle: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.h)),
                child: Text("Sign In")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Aready have an account?",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    "Log In",
                    style: GoogleFonts.poppins(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 11, 41, 186),
                        fontSize: 16.h,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
