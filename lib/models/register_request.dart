import 'dart:convert';

RegistrationRequest registrationRequestFromJson(String str) =>
    RegistrationRequest.fromJson(json.decode(str));

String registrationRequestToJson(RegistrationRequest data) =>
    json.encode(data.toJson());

class RegistrationRequest {
  RegistrationRequest({
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerEmail,
    required this.customerPassword,
    required this.isSeller,
  });

  final String customerFirstName;
  final String customerLastName;
  final String customerEmail;
  final String customerPassword;
  final bool isSeller;

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      RegistrationRequest(
        customerFirstName: json['firstname'] as String,
        customerLastName: json['lastname'] as String,
        customerEmail: json['email'] as String,
        customerPassword: json['password'] as String,
        isSeller: json['is_seller'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'firstname': customerFirstName,
        'lastname': customerLastName,
        'email': customerEmail,
        'password': customerPassword,
        'is_seller': isSeller,
      };
}
