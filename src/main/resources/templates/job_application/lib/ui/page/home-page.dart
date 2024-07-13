import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/ui/component/home-page/job-box.dart';
import 'package:job_application/ui/component/home-page/section.dart';
import 'package:job_application/ui/style/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(430, 932),
    );
    return Scaffold(
      backgroundColor: accentColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 240.h,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Location

                    Container(
                      height: 60.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Location",
                            style: GoogleFonts.poppins(
                                color: backgroundColor,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w200),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.amber,
                                size: 20.h,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "Phnom Penh , KH",
                                style: headline3,
                              ),
                              Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.amber,
                                size: 20.h,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    // Notification Button

                    IconButton(
                      color: backgroundColor,
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                      style: IconButton.styleFrom(
                          backgroundColor: secondaryColors,
                          padding: EdgeInsets.all(15.h)),
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                // Search field

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: TextField(
                            style: bodyText1,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.search,
                                  color: secondaryColors,
                                  size: 25.h,
                                ),
                                border: InputBorder.none,
                                hintText: "Search",
                                hintStyle: GoogleFonts.poppins(
                                    color: secondAccentColors,
                                    fontSize: 16.h))),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(15.h),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/filter.png",
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
          ),
          section("Suggested Jobs"),
          SizedBox(
              height: 210.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => jobBox(),
              )),
          section("Recent Jobs"),
          TextButton(
              onPressed: () {},
              child: Text(
                "All",
                style:
                    GoogleFonts.poppins(fontSize: 16.h, color: backgroundColor),
              ),
              style: TextButton.styleFrom(
                side: BorderSide(width: 1, color: backgroundColor),
                padding: EdgeInsets.all(3.h),
                backgroundColor: primaryColor,
              ))
        ],
      ),
    );
  }
}
