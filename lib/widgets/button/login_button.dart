import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/config/themes.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/services/storage_service.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key});
  final storage = Get.find<StorageServices>();
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed: () {
            storage.storeJWT('jwt');
            Get.offAndToNamed(NavigationRoutes.home);
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
