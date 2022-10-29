import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_seller/config/themes.dart';
import 'package:thirumathikart_seller/controllers/profile_controller.dart';

class ProfileCard extends GetView {
  @override
  final ProfileController controller;

  final FocusNode focusNode;
  final String heading;
  final TextInputType keyboard;
  final TextEditingController editingController;

  const ProfileCard(this.controller, this.focusNode, this.heading,
      this.keyboard, this.editingController,
      {super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Obx(
                () => !controller.enable[heading]!
                    ? IconButton(
                        onPressed: () {
                          controller.switchFlag(heading);
                          Future.delayed(const Duration(milliseconds: 100),
                              focusNode.requestFocus);
                        },
                        icon: const Icon(Icons.edit),
                        color: AppTheme.chakra,
                        iconSize: 20,
                      )
                    : IconButton(
                        onPressed: () {
                          controller.switchFlag(heading);
                          controller.updateValue(
                            editingController.text,
                            heading,
                          );
                        },
                        icon: const Icon(Icons.check_rounded),
                        color: AppTheme.facebook,
                        iconSize: 30,
                      ),
              ),
            ],
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.searchBar,
                  border: controller.validate(
                    editingController.text,
                    heading,
                  )
                      ? Border.all(
                          color: AppTheme.searchBar,
                          width: 2,
                        )
                      : Border.all(
                          color: AppTheme.bin,
                          width: 2,
                        ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    keyboardType: keyboard,
                    controller: editingController,
                    focusNode: focusNode,
                    enabled: controller.enable[heading]!,
                    decoration: InputDecoration(
                      hintText: 'Enter valid $heading',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    onSubmitted: (string) {
                      controller.switchFlag(heading);
                      controller.updateValue(
                        editingController.text,
                        heading,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(
              color: AppTheme.divider,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      );
}
