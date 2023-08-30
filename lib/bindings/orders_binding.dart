import 'package:get/get.dart';
import 'package:thirumathikart_delivery/controllers/orders_controller.dart';
// import 'package:thirumathikart_app/controllers/orders_controller.dart';

class OrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
