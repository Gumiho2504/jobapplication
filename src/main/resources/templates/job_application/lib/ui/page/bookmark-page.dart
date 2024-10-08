import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/ui/component/bookmark-page/job-bookmark-box.dart';
import 'package:job_application/ui/page/signin-page.dart';
import 'package:job_application/ui/style/style.dart';
import 'package:provider/provider.dart';

import '../../model/job.dart';
import '../../model/user.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({super.key});

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  late List<Job> saveJob = [];
  @override
  // void initState() {
  //   super.initState();
  //   // Ensure the context is available and fetch the provider here
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (userProvider.user.saveJobs != null) {
  //       setState(() {
  //         saveJob = userProvider.user.saveJobs!;
  //       });
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // final Job job = Job(id: 0, title: "eer");
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Jobs Bookmark",
              style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: 30.h,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(child: Consumer<UserProvider>(
              builder: (context, userP, child) {
                final User user = userP.user!;
                return Container(
                  child: SingleChildScrollView(
                      child: Column(
                    children: user.saveJobs != null && user.saveJobs!.isNotEmpty
                        ? List.generate(user.saveJobs!.length, (index) {
                            final job = user.saveJobs![index];
                            return JobBookMarkBox(job: job);
                          })
                        : [
                            Center(
                              child: Text('No bookmarked jobs found'),
                            ),
                          ],
                  )),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
