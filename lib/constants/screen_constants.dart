import 'package:flutter/material.dart';
import 'package:thirumathikart_delivery/views/past_orders.dart';
import 'package:thirumathikart_delivery/views/profile.dart';
import 'package:thirumathikart_delivery/views/todays_orders.dart';

class ScreenContants {
  List<Icon> iconItems = const [
    Icon(Icons.home_outlined),
    Icon(Icons.person_outline),
    Icon(Icons.shopping_cart_outlined),
  ];

  var widgetItems =  [ProfilePage(), TodaysOrdersPage(), PastOrdersPage()];

  var navItems =  [
    {
      'title': 'Todays Orders',
      'icon': Icon(Icons.shopping_cart_outlined),
      'widget': TodaysOrdersPage(),
    },
    {
      'title': 'Profile',
      'icon': Icon(Icons.person_outline),
      'widget': ProfilePage(),
    },
    // {
    //   'title': 'Past Orders',
    //   'icon': Icon(Icons.calendar_month_outlined),
    //   'widget': PastOrdersPage(),
    // },
  ];
}
