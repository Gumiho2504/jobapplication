import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/page/home-page.dart';
import 'package:job_application/ui/page/joblist-page.dart';
import 'package:job_application/ui/page/login-page.dart';
import 'package:job_application/ui/page/signin-page.dart';

class GetStartPage extends StatefulWidget {
  const GetStartPage({super.key});

  @override
  State<GetStartPage> createState() => _GetStartPageState();
}

class _GetStartPageState extends State<GetStartPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    ScreenUtil.init(context, designSize: const Size(430, 932));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //color: Colors.deepOrange,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Finding",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 25.h,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Your Perfect Career",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF0B47AF),
                        fontSize: 25.h,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Text(
                "Path Starts Here!",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25.h,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              Text(
                "Lorem ipsum dolor sit amet, consectetur",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "adipiscing elit, sed do eiusmod tempor incididunt",
                style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  //  color: Color.fromARGB(255, 145, 190, 68),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromARGB(255, 16, 16, 146),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100.w, vertical: 20),
                              textStyle: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.h)),
                          child: Text("Let's Get Started")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.h,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                            },
                            child: Text(
                              "Sign In",
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
                  )))
        ],
      ),
    );
  }
}
