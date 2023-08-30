import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.token,
    required this.message,
  });

  final String token;
  final String message;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'message': message,
      };
}

class User {
  User({
    required this.id,
    this.customerFirstName,
    this.customerLastName,
    this.customerEmail,
    this.customerDateJoined,
    this.customerContact,
    this.customerProfilePic,
    required this.token,
    this.isVerified,
    this.firebaseToken,
  });

  final int id;
  final String? customerFirstName;
  final String? customerLastName;
  final String? customerEmail;
  final DateTime? customerDateJoined;
  final String? customerContact;
  final String? customerProfilePic;
  final String token;
  final bool? isVerified;
  final String? firebaseToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        customerFirstName: json['customer_first_name'],
        customerLastName: json['customer_last_name'],
        customerEmail: json['customer_email'],
        customerDateJoined: json['customer_date_joined'] == null
            ? null
            : DateTime.parse(json['customer_date_joined']),
        customerContact: json['customer_contact'],
        customerProfilePic: json['customer_profile_pic'],
        token: json['token'],
        isVerified: json['is_verified'],
        firebaseToken: json['firebase_token'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_first_name': customerFirstName,
        'customer_last_name': customerLastName,
        'customer_email': customerEmail,
        'customer_date_joined': customerDateJoined == null
            ? null
            : "${customerDateJoined!.year.toString().padLeft(4, '0')}-${customerDateJoined?.month.toString().padLeft(2, '0')}-${customerDateJoined!.day.toString().padLeft(2, '0')}",
        'customer_contact': customerContact,
        'customer_profile_pic': customerProfilePic,
        'token': token,
        'is_verified': isVerified,
        'firebase_token': firebaseToken,
      };
}
