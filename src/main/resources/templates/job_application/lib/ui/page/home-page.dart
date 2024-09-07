import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/provider/job_provider.dart';
import 'package:job_application/ui/component/home-page/job-box.dart';
import 'package:job_application/ui/component/home-page/section.dart';
import 'package:job_application/ui/page/search-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentJobTyperSelect = 0;
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context);
    ScreenUtil.init(
      context,
      designSize: Size(430, 932),
    );
    return Column(
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

              GestureDetector(
                onTap: () {
                  Get.to(() => SearchPage(),
                      transition: Transition.size,
                      duration: Duration(milliseconds: 200));
                },
                child: Container(
                  height: 60.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: TextField(
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 18.h),
                                decoration: InputDecoration(
                                    icon: Icon(
                                      Iconsax.search_normal,
                                      color: secondaryColors,
                                      size: 25.h,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Search Jobs",
                                    hintStyle: GoogleFonts.poppins(
                                        color: secondAccentColors,
                                        fontSize: 18.h))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                          height: 60.h,
                          width: 60.h,
                          padding: EdgeInsets.all(15.h),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            "assets/images/filter.png",
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                section("Suggested Jobs"),
                SizedBox(
                    height: 216.h,
                    child: jobProvider.isLoading
                        ? const Center(child: CircularProgressIndicator()) :
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobProvider.jobs.length,
                        itemBuilder: (context, index) {
                          Job job = jobProvider.jobs[index];
                          return JobBox(job: job,);
    }
    )),
                section("Recent Jobs"),
                SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobType.length,
                        itemBuilder: (context, index) => filterTypeButton(
                            jobType[index].toString(), index))),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SizedBox(
                    height: 216.h,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 0, bottom: 10.h),
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 10),
                             // child: JobBox(),
                            )),
                  ),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  filterTypeButton(String title, int index) => Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextButton(
            onPressed: () {
              setState(() {
                currentJobTyperSelect = index;
              });
            },
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 16.h,
                  color: currentJobTyperSelect == index
                      ? backgroundColor
                      : Colors.black),
            ),
            style: TextButton.styleFrom(
              side: BorderSide(width: 1, color: Colors.black.withOpacity(0.1)),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              backgroundColor: currentJobTyperSelect == index
                  ? primaryColor
                  : backgroundColor,
            )),
      );
}
