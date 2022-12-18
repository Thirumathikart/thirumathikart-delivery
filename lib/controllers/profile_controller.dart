import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thirumathikart_delivery/models/address.dart';
import 'package:thirumathikart_delivery/models/seller.dart';

class ProfileController extends GetxController {
  final seller = Seller(
    sellerId: 1,
    firstName: 'Ram',
    lastName: 'Narain',
    accountNumber: 12345,
    mobileNumber: 9988776655,
    address: Address(
      line_1: 'No. 12',
      line_2: '2nd Street',
      district: 'Tiruchi',
      state: 'Tamil Nadu',
      landmark: 'NIT Trichy',
      pincode: 620015,
      sellerId: 1,
    ),
    ifscCode: 'HDFC0000000',
    email: 'ramnarain@gmail.com',
    memberCode: 100,
  ).obs;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final ifscCodeController = TextEditingController();
  final emailController = TextEditingController();
  final addressControllers = {
    'Line 1': TextEditingController(),
    'Line 2': TextEditingController(),
    'District': TextEditingController(),
    'State': TextEditingController(),
    'Landmark': TextEditingController(),
    'Pincode': TextEditingController()
  };
  final memberCodeController = TextEditingController();

  void initialize() {
    firstNameController.text = seller.value.firstName!;
    lastNameController.text = seller.value.lastName!;
    accountNumberController.text = seller.value.accountNumber!.toString();
    mobileNumberController.text = seller.value.mobileNumber!.toString();
    emailController.text = seller.value.email!;
    addressControllers['Line 1']!.text = seller.value.address!.line_1!;
    addressControllers['Line 2']!.text = seller.value.address!.line_2!;
    addressControllers['District']!.text = seller.value.address!.district!;
    addressControllers['State']!.text = seller.value.address!.state!;
    addressControllers['Landmark']!.text = seller.value.address!.landmark!;
    addressControllers['Pincode']!.text =
        seller.value.address!.pincode!.toString();
    ifscCodeController.text = seller.value.ifscCode!;
    memberCodeController.text = seller.value.memberCode!.toString();
  }

  final enable = {
    'First Name': false,
    'Last Name': false,
    'Account Number': false,
    'Mobile Number': false,
    'IFSC Code': false,
    'Email': false,
    'Member Code': false,
  }.obs;

  final enableAddress = {
    'Line 1': false,
    'Line 2': false,
    'District': false,
    'State': false,
    'Landmark': false,
    'Pincode': false,
  }.obs;

  void updateFirstName(String firstName) {
    seller.value.firstName = firstName;
  }

  void updateLastName(String lastName) {
    seller.value.lastName = lastName;
  }

  void updateAccountNumber(int accountNumber) {
    seller.value.accountNumber = accountNumber;
  }

  void updateMobileNumber(int mobileNumber) {
    seller.value.mobileNumber = mobileNumber;
  }

  void updateEmail(String email) {
    seller.value.email = email;
  }

  void updateAddress(String data, String subHeading) {
    if (subHeading == 'Line 1') {
      seller.value.address!.line_1 = data;
    } else if (subHeading == 'Line 2') {
      seller.value.address!.line_2 = data;
    } else if (subHeading == 'District') {
      seller.value.address!.district = data;
    } else if (subHeading == 'State') {
      seller.value.address!.state = data;
    } else if (subHeading == 'Landmark') {
      seller.value.address!.landmark = data;
    } else if (subHeading == 'Pincode') {
      seller.value.address!.pincode = int.parse(data);
    }
  }

  void updateIfscCode(String ifscCode) {
    seller.value.ifscCode = ifscCode;
  }

  void switchFlag(String key) {
    enable[key] = enable[key]! ? false : true;
  }

  void switchFlagAddress(String key) {
    enableAddress[key] = enableAddress[key]! ? false : true;
  }

  void updateValue(String data, String heading) {
    if (heading == 'First Name') {
      updateFirstName(data);
    } else if (heading == 'Last Name') {
      updateLastName(data);
    } else if (heading == 'Account Number') {
      updateAccountNumber(int.parse(data));
    } else if (heading == 'Mobile Number') {
      updateMobileNumber(int.parse(data));
    } else if (heading == 'IFSC Code') {
      updateIfscCode(data);
    } else if (heading == 'Email') {
      updateEmail(data);
    }
  }

  bool validate(String data, String heading) {
    if (heading == 'First Name') {
      return validateName(data, firstNameController);
    } else if (heading == 'Last Name') {
      return validateName(data, lastNameController);
    } else if (heading == 'Account Number') {
      return validateAccountNumber(data);
    } else if (heading == 'Mobile Number') {
      return validateMobileNumber(data);
    } else if (heading == 'IFSC Code') {
      return validateIfscCode(data);
    } else if (heading == 'Email') {
      return validateEmailId(data);
    }
    return false;
  }

  bool validateName(String name, TextEditingController nameController) {
    name = name.trim();
    nameController.text = name;
    if (name != '' &&
        (name.isAlphabetOnly ||
            name.replaceAll('.', '').replaceAll(' ', '').isAlphabetOnly)) {
      return true;
    } else {
      nameController.text = '';
      return false;
    }
  }

  bool validateMobileNumber(String mobileNumber) {
    if (mobileNumber == '') {
      return false;
    }
    mobileNumber = mobileNumber.trim();
    mobileNumberController.text = mobileNumber;
    if ((int.tryParse(mobileNumber) != null && mobileNumber.length == 10) ||
        (int.tryParse(mobileNumber.substring(1, mobileNumber.length)) != null &&
            mobileNumber.length == 13 &&
            mobileNumber[0] == '+')) {
      return true;
    } else {
      mobileNumberController.text = '';
      return false;
    }
  }

  bool validateAccountNumber(String accountNumber) {
    if (accountNumber == '') {
      return false;
    }
    accountNumber = accountNumber.trim();
    accountNumberController.text = accountNumber;
    if (int.tryParse(accountNumber) != null) {
      return true;
    } else {
      accountNumberController.text = '';
      return false;
    }
  }

  bool validateEmailId(String emailId) {
    if (RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailId)) {
      return true;
    } else {
      emailController.text = '';
      return false;
    }
  }

  bool validateAddress(String subHeading, String address) {
    address = address.trim();
    addressControllers[subHeading]!.text = address;
    if (subHeading == 'Pincode') {
      if (int.tryParse(address) != null && address.length == 6) {
        return true;
      } else {
        addressControllers[subHeading]!.text = '';
        return false;
      }
    } else {
      if (address != '') {
        return true;
      } else {
        addressControllers[subHeading]!.text = '';
        return false;
      }
    }
  }

  bool validateIfscCode(String ifscCode) {
    ifscCode = ifscCode.trim().replaceAll(' ', '');
    ifscCodeController.text = ifscCode;
    if (ifscCode.substring(0, 4).isAlphabetOnly &&
        ifscCode.substring(5, ifscCode.length).isNumericOnly &&
        ifscCode.length == 11) {
      return true;
    } else {
      ifscCodeController.text = '';
      return false;
    }
  }
}
