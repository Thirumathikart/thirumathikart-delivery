import 'package:get/instance_manager.dart';
import 'package:thirumathikart_delivery/controllers/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
