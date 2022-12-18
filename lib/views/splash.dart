import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_delivery/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          'assets/tklogo.jpeg',
          height: 250,
        ),
      );
}
