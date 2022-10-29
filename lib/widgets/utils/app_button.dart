import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/home_controller.dart';

class AppButton extends GetView<HomeController> {
  const AppButton({Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        height: 65,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(AppTheme.bg),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: AppTheme.facebook,
                      width: 3,
                    ),
                  ),
                ),
              ),
              child: Text(
                buttonName,
                style: TextStyle(
                  fontSize: 20,
                  color: AppTheme.facebook,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      );
}
