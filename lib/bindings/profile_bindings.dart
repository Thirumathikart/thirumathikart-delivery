import 'package:get/instance_manager.dart';
import 'package:thirumathikart_delivery/controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
