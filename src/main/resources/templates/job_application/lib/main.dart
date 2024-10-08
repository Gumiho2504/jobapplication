import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:job_application/provider/job_provider.dart';
import 'package:job_application/provider/user_provider.dart';
import 'package:job_application/splash.dart';

import 'package:job_application/ui/page/getstart-page.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job Application',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
