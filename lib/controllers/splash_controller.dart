import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';
import 'package:thirumathikart_seller/services/storage_service.dart';

class SplashController extends GetxController {
  final storage = Get.find<StorageServices>();
  // final notification = Get.find<NotificationServices>();
  // late Timer loaderTimer;
  late Timer splashTimer;
  // final loaderAnim = false.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      splashTimer = Timer(const Duration(milliseconds: 3000), () {
        String? token = storage.retriveJWT();
        String route = NavigationRoutes.loginRoute;
        if (token == null) {
          route = NavigationRoutes.home;
        }
        Get.offAndToNamed(route);
      });
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   // await notification.subscribeToTopic('NF22');
    //   // notification.getToken();
    //   // loaderTimer = Timer.periodic(const Duration(milliseconds: 600),
    //   //     (timer) => loaderAnim.value = !loaderAnim.value);
    //   // splashTimer = Timer(const Duration(milliseconds: 3000), () {
    //   //   String route = NavigationRoutes.loginRoute;
    //   //   if (token != null) {
    //   //     route = NavigationRoutes.home;
    //   //   }
    //   //   Get.offAndToNamed(route);
    //   // });
    //   String route = NavigationRoutes.loginRoute;
    //   if (token == null) {
    //     route = NavigationRoutes.home;
    //   }
    //   Get.offAndToNamed(route);
    // });
    super.onInit();
  }
}
