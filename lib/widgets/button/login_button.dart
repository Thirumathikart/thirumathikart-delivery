import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {
            //Get.toNamed(NavigationRoutes.home);
            Get.toNamed(NavigationRoutes.profileRoute);
          },
          color: AppTheme.facebook,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
      );
}
