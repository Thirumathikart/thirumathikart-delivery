import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/constants/orders_constants.dart';
import 'package:thirumathikart_seller/controllers/todays_orders_controller.dart';
import 'package:thirumathikart_seller/widgets/app_bar.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/widgets/button/orders_button.dart';

class TodaysOrdersPage extends GetView<TodaysOrdersController> {
  const TodaysOrdersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar('Todays Orders'),
        body: buildItems(orderList),
      );
  Widget buildItems(List<Map<String, Object>> orderList) => ListView.builder(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
        itemCount: orderList.length,
        itemBuilder: listView,
      );
  Widget listView(
    BuildContext context,
    int position,
  ) =>
      Card(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'ORDER ID: ${orderList[position]["OrderID"]}',
              style: TextStyle(
                fontSize: 23,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Customer Name: ${orderList[position]["CustomerName"]}',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Customer Address: ${orderList[position]["CustomerAddress"]}',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Customer contact: ${orderList[position]['CustomerContact']}',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Total: ${orderList[position]['Total']}',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              'Payment: ${orderList[position]['Payment']}',
              style: TextStyle(
                fontSize: 17,
                letterSpacing: 0.5,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: OrdersButton(
                  buttonName: 'GET DIRECTIONS', onPressed: () => {}),
            ),
            Expanded(
              child: OrdersButton(
                  buttonName: 'CALL CUSTOMER', onPressed: () => {}),
            ),
          ]),
        ]),
      );
}
