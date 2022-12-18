import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/constants/navigation_routes.dart';

PreferredSizeWidget appBar(String label) => AppBar(
    backgroundColor: AppTheme.bg,
    elevation: 1,
    iconTheme: IconThemeData(color: AppTheme.textPrimary),
    title: Row(children: [
      Visibility(
          visible: Get.routing.current != NavigationRoutes.map,
          child: Container(
              margin:
                  const EdgeInsets.only(left: 0, top: 5, bottom: 5, right: 10),
              child: Image.asset(
                'assets/tk.png',
                width: 35,
                height: 35,
              ))),
      Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            fontSize: 22),
        textAlign: TextAlign.center,
      )
    ]),
    centerTitle: true);
