import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/bindings/forgotPassword.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/models/login_request.dart';
import 'package:thirumathikart_delivery/models/register_request.dart';

import 'package:thirumathikart_delivery/services/api_service.dart';
import 'package:thirumathikart_delivery/services/storage_service.dart';


class AuthController extends GetxController {
  PageController pageViewController = PageController(initialPage: 0);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final api = Get.find<ApiServices>().api;
  final storage = Get.find<StorageServices>();
  final isLoading = false.obs;
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final forgotPasswordEmailController=TextEditingController();

  var firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailNameTextController = TextEditingController();
  final passwordRegTextController = TextEditingController();
  final reEnterTextController = TextEditingController();
  final contactTextController = TextEditingController();

  void login() async {
    final userName = userNameTextController.text;
    final password = passwordTextController.text;
    if (userName.isEmpty || password.isEmpty) {
      Get.snackbar('Invalid Credentials', 'Unable To Login');
      return;
    }
    isLoading.value = true;
    api
        .loginCutomer(
            LoginRequest(email: userName, password: password), storage)
        .then((response) {
      isLoading.value = false;
      navigateToHome();
    }, onError: (err) {
      isLoading.value = false;
      Get.snackbar('Failed To Login', err.toString());
    });
  }

  void forgotPassword() async {
  final email = forgotPasswordEmailController.text;
  if (email.isEmpty) {
    Get.snackbar('Invalid Email', 'Please enter your email address');
    return;
  }
  isLoading.value = true;
  api.forgotPassword(email).then((_) {
    isLoading.value = true;
    Get.snackbar('Forgot Password', 'Password reset instructions sent to $email');
  }, onError: (err) {
    isLoading.value = false;
    Get.snackbar('Forgot Password Failed', err.toString());
  });
}


  void register() async {
    final firstName = firstNameTextController.text;
    final lastName = lastNameTextController.text;
    final email = emailNameTextController.text;
    final password = passwordRegTextController.text;
    final reEnterPassword = reEnterTextController.text;
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        reEnterPassword.isEmpty ||
        // contact.isEmpty ||
        reEnterPassword != password) {
      Get.snackbar('Invalid Credentials', 'Unable To Register');
      return;
    }
    isLoading.value = true;
    api
        .registerCutomer(RegistrationRequest(
      customerFirstName: firstName,
      customerLastName: lastName,
      customerEmail: email,
      customerPassword: password,
      isSeller: false,
    ))
        .then((response) {
      isLoading.value = false;
      navigateToLogin();
    }, onError: (err) {
      isLoading.value = false;
      Get.snackbar('Failed To Register', err.toString());
    });
  }

  void navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAndToNamed(NavigationRoutes.home);
    });
  }

  void navigateToLogin() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAndToNamed(NavigationRoutes.loginRoute);
    });
  }
}
