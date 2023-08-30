import 'package:get/instance_manager.dart';
import 'package:thirumathikart_delivery/controllers/auth_controller.dart';

class forgotPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}