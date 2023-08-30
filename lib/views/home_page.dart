import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_delivery/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/config/themes.dart';
import 'package:thirumathikart_delivery/constants/screen_constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenConstants = ScreenContants();
    return SafeArea(
        child: Scaffold(
          //   appBar: AppBar(
              
          //    title: const Text('Thirumathikart',style:TextStyle(color:Colors.black)),
          //    backgroundColor:Colors.white,
          //   actions: [
          //     IconButton(
          //       icon: const Icon(Icons.logout),
          //       onPressed: () {
          //         // Show SnackBar before logging out
          //         Get.snackbar(
          //           'Logout',
          //           'Are you sure you want to logout?',
          //           duration: const Duration(seconds: 5),
          //           snackPosition: SnackPosition.TOP,
          //           mainButton: TextButton(
          //             onPressed: () {
          //               // Call your logout logic here
          //               // For example:
          //               controller.logout();
          //               Get.back(); // Dismiss the SnackBar
          //             },
                     
          //             child: const Text(
          //               'Yes',
          //               style: TextStyle(color: Color.fromARGB(255, 241, 4, 4)),
          //             ),
          //           ),
          //         );
          //       },
          //        color:Colors.black,
          //     ),
          //   ],
          // ),
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: screenConstants.navItems
                    .map((e) => e['widget'] as Widget)
                    .toList(),
              ),
            ]),
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                elevation: 0,
                currentIndex: controller.selectedIndex.value,
                onTap: (value) {
                  controller.selectedIndex.value = value;
                  controller.onPageChanged();
                },
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppTheme.navColor,
                unselectedItemColor: AppTheme.deSelected,
                selectedLabelStyle: TextStyle(color: AppTheme.textPrimary),
                showUnselectedLabels: false,
                selectedFontSize: 10,
                items: screenConstants.navItems
                    .map((e) => BottomNavigationBarItem(
                          icon: e['icon'] as Widget,
                          label: e['title'] as String,
                        ))
                    .toList()))));
  }
}
