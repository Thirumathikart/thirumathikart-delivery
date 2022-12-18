import 'package:get/get.dart';
import 'package:thirumathikart_delivery/controllers/todays_orders_controller.dart';

class TodaysOrdersBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TodaysOrdersController());
  }
}
