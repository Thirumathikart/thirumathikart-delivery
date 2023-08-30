import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/config/themes.dart';
import 'package:thirumathikart_delivery/controllers/orders_controller.dart';
import 'package:thirumathikart_delivery/widgets/app_bar.dart';
// import 'package:thirumathikart_app/config/themes.dart';
// import 'package:thirumathikart_app/constants/navigation_routes.dart';
// import 'package:thirumathikart_app/controllers/orders_controller.dart';
// import 'package:thirumathikart_app/widgets/app_bar.dart';

class OrdersPage extends GetView<OrdersController> {
  const OrdersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.fetchOrder();
    return Scaffold(appBar: appBar('My Orders'), body: buildItems());
  }

  Widget buildItems() => Obx(() => ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 32, bottom: 32),
        itemBuilder: ordersList,
        itemCount: controller.order.length,
      ));
  Widget ordersList(context, index) => GestureDetector(
        // onTap: () => {
        //   Get.toNamed(NavigationRoutes.myOrdersDetailsRoute,
        //       arguments: controller.order[index].orderItemsList)
        // },
        child: Card(
            child: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 2, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Order ID : ${controller.order[index].id}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Order Status : ${controller.order[index].status}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Total Price : ${controller.order[index].totalAmount}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Seller Name : ${controller.order[index].sellerName}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Customer Address : ${controller.order[index].customerAddress}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10, top: 2, bottom: 5, right: 5),
                        alignment: Alignment.center,
                        child: Text(
                          'Seller Address : ${controller.order[index].sellerAddress}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ),
                    ]))),
      );
}
