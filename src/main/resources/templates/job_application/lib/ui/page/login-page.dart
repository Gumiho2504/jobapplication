import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/navigationController.dart';
import 'package:job_application/ui/page/signin-page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final passwords = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool isShow = true;
  // void login(String email,String password) async {
  //   try {
  //     await userProvider.userLogin(email, password);
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //         builder: (context) => NavigetionPage(user: userProvider.user)));
  //   }catch(e){
  //     print(e);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text('Failed to register'),
  //     ));
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context);
    void Login() {}
    return Scaffold(
        body: Form(
      key: _keyForm,
      child: Column(
        children: [
          Container(
            color: Colors.deepOrange,
            width: double.infinity,
            height: 550.h,
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
                color: Color.fromARGB(255, 8, 64, 110),
                borderRadius: BorderRadius.circular(10.r)),
            child: TextFormField(
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.h),
              controller: email,
              decoration: InputDecoration(
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
          ElevatedButton(
              onPressed: () async {
                if (_keyForm.currentState!.validate()) {
                  String _email = email.text;
                  String _password = passwords.text;
                  //login(_email, _password);
                  try {
                    await _userProvider.userLogin(_email, _password);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    int userId = _userProvider.user.id!;
                    await prefs.setBool('isLoggedIn', true);
                    await prefs.setInt('userId', userId);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => NavigetionPage()));
                    // Navigator.of(context).pushAndRemoveUntil(
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         NavigetionPage(), // Replace with your new screen widget
                    //   ),
                    //   (Route<dynamic> route) =>
                    //       false, // This removes all previous routes
                    // );
                  } catch (e) {
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Failed to register'),
                    ));
                  }

                  // Get.off(NavigetionPage(),transition: Transition.noTransition);
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
              child: Text("Log In")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16.h,
                    fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text(
                  "Sign Up",
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
    ));
  }
}
