import 'package:thirumathikart_delivery/models/address.dart';

class Seller {
  String? firstName, lastName, email, ifscCode;
  final int? sellerId;
  int? mobileNumber, accountNumber, memberCode;
  Address? address;
  Seller({
    this.sellerId,
    this.firstName,
    this.lastName,
    this.accountNumber,
    this.mobileNumber,
    this.address,
    this.email,
    this.ifscCode,
    this.memberCode,
  });
}
