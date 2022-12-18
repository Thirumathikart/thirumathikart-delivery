import 'package:get/instance_manager.dart';
import 'package:thirumathikart_delivery/controllers/home_controller.dart';
import 'package:thirumathikart_delivery/controllers/profile_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ProfileController());
  }
}
