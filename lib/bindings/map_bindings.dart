import 'package:get/instance_manager.dart';
import 'package:thirumathikart_delivery/controllers/map_controller.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MapController());
  }
}
