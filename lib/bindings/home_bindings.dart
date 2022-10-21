import 'package:get/instance_manager.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
