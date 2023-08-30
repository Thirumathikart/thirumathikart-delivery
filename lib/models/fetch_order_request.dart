import 'dart:convert';

FetchOrderRequest fetchorderFromJson(String str) =>
    FetchOrderRequest.fromJson(json.decode(str));

String fetchorderToJson(FetchOrderRequest data) => json.encode(data.toJson());

class FetchOrderRequest {
  FetchOrderRequest({
    required this.order,
    required this.item,
  });

  Order order;
  List<Item> item;

  factory FetchOrderRequest.fromJson(Map<String, dynamic> json) =>
      FetchOrderRequest(
        order: Order.fromJson(json['order']),
        item: List<Item>.from(json['item'].map(Item.fromJson)),
      );

  Map<String, dynamic> toJson() => {
        'order': order.toJson(),
        'item': List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.order,
    required this.orderId,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.quantity,
    required this.price,
  });

  Order order;
  int orderId;
  String name;
  int categoryId;
  String description;
  int quantity;
  int price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        order: Order.fromJson(json['Order']),
        orderId: json['OrderID'],
        name: json['Name'],
        categoryId: json['CategoryID'],
        description: json['Description'],
        quantity: json['Quantity'],
        price: json['Price'],
      );

  Map<String, dynamic> toJson() => {
        'Order': order.toJson(),
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
    required this.customerId,
    required this.customerAddressId,
    required this.sellerId,
    required this.sellerAddressId,
    required this.deliveryPartnerId,
    required this.orderStatus,
    // required this.,
  });

  int customerId;
  int customerAddressId;
  int sellerId;
  int sellerAddressId;
  int deliveryPartnerId;
  String orderStatus;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        customerId: json['CustomerID'],
        customerAddressId: json['CustomerAddressID'],
        sellerId: json['SellerID'],
        sellerAddressId: json['SellerAddressID'],
        deliveryPartnerId: json['DeliveryPartnerID'],
        orderStatus: json['OrderStatus'],
      );

  Map<String, dynamic> toJson() => {
        'CustomerID': customerId,
        'CustomerAddressID': customerAddressId,
        'SellerID': sellerId,
        'SellerAddressID': sellerAddressId,
        'DeliveryPartnerID': deliveryPartnerId,
        'OrderStatus': orderStatus,
      };
}
