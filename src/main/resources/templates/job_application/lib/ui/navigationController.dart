import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/page/bookmark-page.dart';
import 'package:job_application/ui/page/explore-page.dart';
import 'package:job_application/ui/page/home-page.dart';
import 'package:job_application/ui/page/profile-page.dart';
import 'package:job_application/ui/style/style.dart';

class NavigetionPage extends StatefulWidget {
  const NavigetionPage({super.key});

  @override
  State<NavigetionPage> createState() => _NavigetionPageState();
}

class _NavigetionPageState extends State<NavigetionPage> {
  final navigatorController = Get.put(NavigationController());
  int currentPageSelect = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(430, 932),
    );
    return Scaffold(
      backgroundColor: accentColor,
      body: Obx(() =>
          navigatorController.page[navigatorController.currentSelect.value]),
      bottomNavigationBar: Container(
          height: 120.h,
          width: double.infinity,
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 0.2,
                    spreadRadius: 0.2,
                    offset: Offset.zero)
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r))),
          child: Obx(
            () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buttonNavBarButtonBuild(
                      "Home", const Icon(CupertinoIcons.house_fill), 0),
                  _buttonNavBarButtonBuild(
                      "Explore", const Icon(Iconsax.location5), 1),
                  _buttonNavBarButtonBuild("BookMarks",
                      const Icon(CupertinoIcons.bookmark_solid), 2),
                  _buttonNavBarButtonBuild("Profile",
                      const Icon(CupertinoIcons.person_circle_fill), 3)
                ]),
          )),
    );
  }

  _buttonNavBarButtonBuild(String label, Icon icon, int selectIndex) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              navigatorController.currentSelect.value = selectIndex;
            },
            icon: icon,
            iconSize: 27.h,
            color: navigatorController.currentSelect.value == selectIndex
                ? primaryColor
                : secondAccentColors,
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
                color: navigatorController.currentSelect.value == selectIndex
                    ? primaryColor
                    : secondAccentColors,
                fontSize: 12.h),
          )
        ],
      );

  _bottomNavigationBarBuilds() => BottomNavigationBar(
          currentIndex: navigatorController.currentSelect.value,
          onTap: (value) => {navigatorController.currentSelect.value = value},
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.location5), label: "Explore"),
            // BottomNavigationBarItem(
            //     icon: Icon(Iconsax.profile_circle), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_circle), label: "Profile"),
          ]);
}

class NavigationController extends GetxController {
  RxInt currentSelect = 0.obs;

  final page = [
    const HomePage(),
    const ExplorationPage(),
    const BookMarkPage(),
    const ProfilePage()
  ];
}
