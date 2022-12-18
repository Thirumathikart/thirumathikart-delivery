import 'package:flutter/material.dart';
import 'package:thirumathikart_delivery/config/themes.dart';
import 'package:thirumathikart_delivery/controllers/profile_controller.dart';
import 'package:thirumathikart_delivery/widgets/app_bar.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/widgets/card/profile_address_card.dart';
import 'package:thirumathikart_delivery/widgets/card/profile_card.dart';
import 'package:thirumathikart_delivery/widgets/utils/app_button.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNodeFirstName = FocusNode();
    final FocusNode focusNodeLastName = FocusNode();
    final FocusNode focusNodeAccountNumber = FocusNode();
    final FocusNode focusNodeMobileNumber = FocusNode();
    final FocusNode focusNodeEmail = FocusNode();
    final focusNodeAddresses = {
      'Line 1': FocusNode(),
      'Line 2': FocusNode(),
      'District': FocusNode(),
      'State': FocusNode(),
      'Landmark': FocusNode(),
      'Pincode': FocusNode(),
    };
    final FocusNode focusNodeIfscCode = FocusNode();

    controller.initialize();

    return Scaffold(
      appBar: appBar('Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              controller,
              focusNodeFirstName,
              'First Name',
              TextInputType.name,
              controller.firstNameController,
            ),
            ProfileCard(
              controller,
              focusNodeLastName,
              'Last Name',
              TextInputType.name,
              controller.lastNameController,
            ),
            ProfileCard(
              controller,
              focusNodeAccountNumber,
              'Account Number',
              TextInputType.number,
              controller.accountNumberController,
            ),
            ProfileCard(
              controller,
              focusNodeMobileNumber,
              'Mobile Number',
              TextInputType.phone,
              controller.mobileNumberController,
            ),
            ProfileCard(
              controller,
              focusNodeEmail,
              'Email',
              TextInputType.emailAddress,
              controller.emailController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['Line 1']!,
              'Line 1',
              TextInputType.multiline,
              controller.addressControllers['Line 1']!,
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['Line 2']!,
              'Line 2',
              TextInputType.multiline,
              controller.addressControllers['Line 2']!,
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['Landmark']!,
              'Landmark',
              TextInputType.multiline,
              controller.addressControllers['Landmark']!,
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['District']!,
              'District',
              TextInputType.name,
              controller.addressControllers['District']!,
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['State']!,
              'State',
              TextInputType.name,
              controller.addressControllers['State']!,
            ),
            ProfileAddressCard(
              controller,
              focusNodeAddresses['Pincode']!,
              'Pincode',
              TextInputType.number,
              controller.addressControllers['Pincode']!,
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
            ProfileCard(
              controller,
              focusNodeIfscCode,
              'IFSC Code',
              TextInputType.name,
              controller.ifscCodeController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Member Code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppTheme.searchBar,
                  border: Border.all(
                    color: AppTheme.searchBar,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    controller: controller.memberCodeController,
                    enabled: controller.enable['Member Code']!,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppButton(
                  buttonName: 'Save',
                  onPressed: () =>
                      {Get.snackbar('Profile', 'Saved Successfully')}),
            ),
          ],
        ),
      ),
    );
  }
}
