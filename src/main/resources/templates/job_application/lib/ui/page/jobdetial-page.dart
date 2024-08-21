import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/model/job.dart';
import 'package:job_application/ui/component/detial-page/about-detail.dart';
import 'package:job_application/ui/component/detial-page/company-detail.dart';
import 'package:job_application/ui/component/detial-page/similarjob-detail.dart';
import 'package:job_application/ui/page/editjob-page.dart';
import 'package:job_application/ui/style/style.dart';

class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditJobPage(jobData: job)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${job.title}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Description: ${job.description}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Location: ${job.location}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Company: ${job.company}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Type: ${job.type}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  final labelArray = ["About", "Company", "Similar Jobs"];
  List<Widget> page = [
    const AboutDetail(),
    const CompanyAtDetail(),
    const SimilarJobDetial()
  ];
  int currentSelect = 0;
  int activePage = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(430, 932),
    );
    return Scaffold(
        backgroundColor: accentColor.withOpacity(0.98),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Colors.grey.withOpacity(0.5))),
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20.r)),
            padding: EdgeInsets.only(left: 30.w, top: 20.h, right: 30.w),
            height: 80.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              child: Text(
                "Apply for Job",
                style: GoogleFonts.poppins(
                    color: backgroundColor,
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {},
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
// Detail Page App Bar
              _buildTopNavationAppBar(),
              SizedBox(
                height: 10.h,
              ),
// Detail
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50.h),
                    //color: Colors.amber,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: accentColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                offset: const Offset(-1, 0)),
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                offset: const Offset(1, 0))
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Text(
                            "UI Designer",
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 24.h),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Briosous Solution",
                            style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 15.h,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.location5,
                                color: primaryColor,
                                size: 20.h,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                "Phnom Penh , Kh",
                                style: GoogleFonts.poppins(
                                    fontSize: 15.h,
                                    fontWeight: FontWeight.w400,
                                    color: darkAccentcolor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SalaryBox(Iconsax.money, "Salary (Monthly)",
                                  "\$1K-\$3K"),
                              _SalaryBox(
                                  Iconsax.briefcase, "Job Type", "Full-Time"),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SalaryBox(Iconsax.buildings_2, "Working Model",
                                  "Remote"),
                              _SalaryBox(
                                  Iconsax.chart_21, "Level", "Intership"),
                            ],
                          ),

                          SizedBox(
                            height: 10.h,
                          ),
// About Job
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Container(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      labelArray.length,
                                      (int) =>
                                          _DetailBar(labelArray[int], int))),
                            ),
                          ),
                          Container(
                            height: 1.h,
                            color: Colors.black.withOpacity(0.4),
                          ),
// Page View
                          Expanded(
                              child: Container(
                            color: backgroundColor,
                            child: PageView.builder(
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                itemCount: page.length,
                                onPageChanged: (value) => {
                                      setState(() {
                                        currentSelect = value;
                                        activePage = value;
                                      })
                                    },
                                itemBuilder: (context, index) => page[index]),
                          ))
                        ],
                      ),
                    ),
                  ),

// Company Logo

                  Positioned(
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: primaryColor,
                        child: Text(
                          "B.",
                          style: GoogleFonts.poppins(
                              color: backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 45.h),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ));
  }

  _DetailBar(String label, int index) => Expanded(
        child: Container(
          // color: Colors.amber,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(overlayColor: primaryColor),
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  setState(() {
                    currentSelect = index;
                    activePage = index;
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceInOut);
                  });
                },
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                height: currentSelect == index ? 3.h : 0,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r))),
              )
            ],
          ),
        ),
      );

  _SalaryBox(IconData icon, String label, String type) => Container(
        width: 180.w,
        height: 58.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5.h),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Row(
          children: [
            Container(
              width: 45.h,
              height: 45.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
              child: Icon(
                icon,
                color: primaryColor,
                size: 25.h,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style:
                      GoogleFonts.poppins(fontSize: 12.h, color: Colors.grey),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  type,
                  style: GoogleFonts.poppins(
                      fontSize: 16.h,
                      color: primaryColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      );

  _buildTopNavationAppBar() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Container(
          //color: Colors.amber,
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
// Back Buttton

              IconButton(
                  style: IconButton.styleFrom(
                      padding: EdgeInsets.all(10.h),
                      backgroundColor: backgroundColor,
                      side: BorderSide(width: 0.01, color: Colors.grey)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Iconsax.arrow_left)),

              Row(
                children: [
                  IconButton(
                      style: IconButton.styleFrom(
                          padding: EdgeInsets.all(10.h),
                          backgroundColor: backgroundColor,
                          side: BorderSide(width: 0.01, color: Colors.grey)),
                      onPressed: () {},
                      icon: Icon(Iconsax.bookmark)),
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                      style: IconButton.styleFrom(
                          padding: EdgeInsets.all(10.h),
                          backgroundColor: backgroundColor,
                          side: BorderSide(width: 0.01, color: Colors.grey)),
                      onPressed: () {},
                      icon: Icon(Icons.share_rounded)),
                ],
              ),
            ],
          ),
        ),
      );
}
