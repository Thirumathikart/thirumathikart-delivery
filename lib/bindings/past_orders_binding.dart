import 'package:get/get.dart';
import 'package:thirumathikart_delivery/controllers/past_orders_controller.dart';

class PastOrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PastOrdersController());
  }
}
