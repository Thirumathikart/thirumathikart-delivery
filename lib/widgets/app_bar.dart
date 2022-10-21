import 'package:flutter/material.dart';
import 'package:thirumathikart_seller/config/themes.dart';

PreferredSizeWidget appBar(String label) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
          fontSize: 25),
    ),
    centerTitle: true);
