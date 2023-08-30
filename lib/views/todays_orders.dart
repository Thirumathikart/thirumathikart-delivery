import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/constants/navigation_routes.dart';
import 'package:thirumathikart_delivery/constants/orders_constants.dart';
import 'package:thirumathikart_delivery/controllers/orders_controller.dart';
import 'package:thirumathikart_delivery/controllers/todays_orders_controller.dart';
import 'package:thirumathikart_delivery/widgets/app_bar.dart';
import 'package:thirumathikart_delivery/config/themes.dart';
import 'package:thirumathikart_delivery/widgets/button/orders_button.dart';
import 'package:url_launcher/url_launcher.dart';

class TodaysOrdersPage extends GetView<TodaysOrdersController> {
   TodaysOrdersPage({Key? key}) : super(key: key);
  final TodaysOrdersController controller = Get.put(TodaysOrdersController());
  @override

  Widget build(BuildContext context) {
    controller.fetchOrder();
    return Scaffold(

      // appBar: appBar('My Orders')
      appBar: AppBar(
            title: appBar('My Orders'),
            backgroundColor: Colors.white, // Set the background color to white
            actions: [
              IconButton(
            
          icon: const Icon(
          Icons.logout,
          color: Colors.green, // Set the color to green
  ),
                onPressed: () {
                  // Show SnackBar before logging out
                  Get.snackbar(
                    'Logout',
                    'Are you sure you want to logout?',
                    duration: const Duration(seconds: 5),
                    snackPosition: SnackPosition.TOP,
                    mainButton: TextButton(
                      onPressed: () {
                        // Call your logout logic here
                        // For example:
                        controller.logout();
                        Get.back(); // Dismiss the SnackBar
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.red), // Set the text color to green
                      ),
                    ),
                  );
                },
              ),
            ],
          )
      , body: buildItems());
  }
    Widget buildItems() => Obx(() => ListView.builder(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 32, bottom: 32),
        itemBuilder: ordersList,
        itemCount: controller.order.length,
      ));

  // Widget buildItems(List<Map<String, Object>> orderList) => ListView.builder(
  //       padding:
  //           const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
  //       itemCount: orderList.length,
  //       itemBuilder: listView,
  //     );

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
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //       left: 10, top: 2, bottom: 5, right: 5),
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     'Total Price : ${controller.order[index].totalAmount}',
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //       color: AppTheme.textPrimary,
                      //     ),
                      //   ),
                      // ),
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
                          'Customer Contact: ${controller.order[index].customerContact}',
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
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: OrdersButton(
                  buttonName: 'GET DIRECTIONS',
                  onPressed: () => {Get.toNamed(NavigationRoutes.map)}),
            ),
            Expanded(
              child: OrdersButton(
                  buttonName: 'CALL CUSTOMER',
                  onPressed: () => {
                        launchUrl(Uri.parse(
                            'tel:${controller.order[index].customerContact}'))
                      }),
            ),
          ]),
                    ]))),
                    
      );
}
                    