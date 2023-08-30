// To parse this JSON data, do
//
//     final fetchOrderResponse = fetchOrderResponseFromJson(jsonString);

import 'dart:convert';

FetchOrderResponse fetchOrderResponseFromJson(String str) =>
    FetchOrderResponse.fromJson(json.decode(str));

String fetchOrderResponseToJson(FetchOrderResponse data) =>
    json.encode(data.toJson());

class FetchOrderResponse {
  FetchOrderResponse({
    this.response,
  });

  List<Response>? response;

  factory FetchOrderResponse.fromJson(Map<String, dynamic> json) =>
      FetchOrderResponse(
        response: List<Response>.from(
            json['response'].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'response': List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    this.order,
    this.items,
    this.customer,
    this.seller,
  });

  Order? order;
  List<Item>? items;
  Customer? customer;
  Customer? seller;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        order: Order.fromJson(json['order']),
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
        customer: Customer.fromJson(json['customer']),
        seller: Customer.fromJson(json['seller']),
      );

  Map<String, dynamic> toJson() => {
        'order': order!.toJson(),
        'items': List<dynamic>.from(items!.map((x) => x.toJson())),
        'customer': customer!.toJson(),
        'seller': seller!.toJson(),
      };
}

class Customer {
  Customer({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.fcmToken,
    this.address,
    this.contact,
  });

  int? userId;
  String? email;
  String? firstName;
  String? lastName;
  String? fcmToken;
  Address? address;
  String? contact;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        userId: json['user_id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        fcmToken: json['fcm_token'],
        address: Address.fromJson(json['address']),
        contact: json['contact'] == null ? null : json['contact'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'fcm_token': fcmToken,
        'address': address!.toJson(),
        'contact': contact == null ? null : contact,
      };
}

class Address {
  Address({
    this.addressId,
    this.name,
    this.line1,
    this.line2,
    this.landmark,
    this.district,
    this.state,
    this.pincode,
  });

  int? addressId;
  String? name;
  String? line1;
  String? line2;
  String? landmark;
  String? district;
  String? state;
  String? pincode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressId: json['address_id'],
        name: json['name'],
        line1: json['line_1'],
        line2: json['line_2'],
        landmark: json['landmark'],
        district: json['district'],
        state: json['state'],
        pincode: json['pincode'],
      );

  Map<String, dynamic> toJson() => {
        'address_id': addressId,
        'name': name,
        'line_1': line1,
        'line_2': line2,
        'landmark': landmark,
        'district': district,
        'state': state,
        'pincode': pincode,
      };
}

class Item {
  Item({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.order,
    this.orderId,
    this.name,
    this.categoryId,
    this.description,
    this.quantity,
    this.price,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  Order? order;
  int? orderId;
  String? name;
  int? categoryId;
  String? description;
  int? quantity;
  int? price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['ID'],
        createdAt: DateTime.parse(json['CreatedAt']),
        updatedAt: DateTime.parse(json['UpdatedAt']),
        deletedAt: json['DeletedAt'],
        order: Order.fromJson(json['Order']),
        orderId: json['OrderID'],
        name: json['Name'],
        categoryId: json['CategoryID'],
        description: json['Description'],
        quantity: json['Quantity'],
        price: json['Price'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'CreatedAt': createdAt!.toIso8601String(),
        'UpdatedAt': updatedAt!.toIso8601String(),
        'DeletedAt': deletedAt,
        'Order': order!.toJson(),
        'OrderID': orderId,
        'Name': name,
        'CategoryID': categoryId,
        'Description': description,
        'Quantity': quantity,
        'Price': price,
      };
}

class Order {
  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.customerId,
    this.customerAddressId,
    this.sellerId,
    this.sellerAddressId,
    this.deliveryPartnerId,
    this.orderStatus,
    this.contact,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? customerId;
  int? customerAddressId;
  int? sellerId;
  int? sellerAddressId;
  int? deliveryPartnerId;
  String? orderStatus;
  String? contact;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['ID'],
        createdAt: DateTime.parse(json['CreatedAt']),
        updatedAt: DateTime.parse(json['UpdatedAt']),
        deletedAt: json['DeletedAt'],
        customerId: json['CustomerID'],
        customerAddressId: json['CustomerAddressID'],
        sellerId: json['SellerID'],
        sellerAddressId: json['SellerAddressID'],
        deliveryPartnerId: json['DeliveryPartnerID'],
        orderStatus: json['OrderStatus'],
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'CreatedAt': createdAt!.toIso8601String(),
        'UpdatedAt': updatedAt!.toIso8601String(),
        'DeletedAt': deletedAt,
        'CustomerID': customerId,
        'CustomerAddressID': customerAddressId,
        'SellerID': sellerId,
        'SellerAddressID': sellerAddressId,
        'DeliveryPartnerID': deliveryPartnerId,
        'OrderStatus': orderStatus,
      };


  
}
