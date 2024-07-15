import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_application/ui/page/explore-page.dart';
import 'package:job_application/ui/page/home-page.dart';
import 'package:job_application/ui/page/profile-page.dart';

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
      designSize: Size(430, 932),
    );
    return Scaffold(
      body: Obx(() =>
          navigatorController.page[navigatorController.currentSelect.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
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
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  RxInt currentSelect = 0.obs;
  final page = [HomePage(), ExplorationPage(), ProfilePage()];
}
