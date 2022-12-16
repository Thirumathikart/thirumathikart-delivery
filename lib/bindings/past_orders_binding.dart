import 'package:get/get.dart';
import 'package:thirumathikart_seller/controllers/past_orders_controller.dart';

class PastOrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PastOrdersController());
  }
}
