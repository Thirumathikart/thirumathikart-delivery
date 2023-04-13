import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/models/login_request.dart';
import 'package:thirumathikart_delivery/services/api_service.dart';
import 'package:thirumathikart_delivery/services/storage_service.dart';
class LoginController extends GetxController {
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final isLoading = false.obs;
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var userToken = '';

  void login() async {
    final userName = userNameTextController.text;
    final password = passwordTextController.text;
    if (userName.isEmpty || password.isEmpty) {
      Get.snackbar('Invalid Credentials', 'Unable To Login');
      return;
    }
    isLoading.value = true;
    api
        .loginDelivery(LoginRequest(email: userName, password: password), storage)
        .then((response) {
      isLoading.value = false;
      navigateToHome();
    }, onError: (err) {
      isLoading.value = false;
      Get.snackbar('Failed To Login', err.toString());
    });
  }

  void navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offNamed(NavigationRoutes.home);
    });
  }

  void navigateToLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAndToNamed(NavigationRoutes.loginRoute);
    });
  }

  bool userTokenFetch() {
    if (storage.retriveJWT() == null) {
      userToken = '';
    } else {
      userToken = storage.retriveJWT()!;
    }
    if (userToken == '') {
      return false;
    } else {
      return true;
    }
  }
}
