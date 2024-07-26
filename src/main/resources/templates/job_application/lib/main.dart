import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:job_application/provider/job_provider.dart';
import 'package:job_application/ui/navigationController.dart';

import 'package:job_application/ui/page/getstart-page.dart';
import 'package:job_application/ui/page/joblist-page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JobProvider(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const GetStartPage(),
        ),
      ),
    );
  }
}
