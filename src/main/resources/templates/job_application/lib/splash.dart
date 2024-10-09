import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/navigationController.dart';
import 'package:job_application/ui/page/getstart-page.dart';
import 'package:job_application/ui/page/jobdetial-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAppStatus();
  }

  Future<void> checkAppStatus() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? userId = pref.getInt("userId");
    bool? isLogin = pref.getBool('isLoggedIn') ?? false;
    print("userId - ${isLogin} - ${userId}");
    if (isLogin!) {
      final _userP = Provider.of<UserProvider>(context, listen: false);
      await _userP.findUserById(userId!);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavigetionPage(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const GetStartPage(),
        ),
      );
    }

    //ignore: use_build_context_synchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(
          "AJIP",
          style: GoogleFonts.monofett(
              fontSize: 100, letterSpacing: 5, color: primaryColor),
        ),
      ),
    );
  }
}
