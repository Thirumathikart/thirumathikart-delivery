import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
