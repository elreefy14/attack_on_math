// import 'package:json_annotation/json_annotation.dart';
//
// part 'auth_request.g.dart';
//
// @JsonSerializable()
// class AuthRequest {
//   final String api_key;
//
//   AuthRequest({required this.api_key});
//
//   factory AuthRequest.fromJson(Map<String, dynamic> json) => _$AuthRequestFromJson(json);
//   Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
// }
//{
//   "auth_token": "ZXlKaGlPaUpJVXpVeE1pSX1Y0NJmV5Sn...",
//   "amount_cents": "100",
//   "expiration": 3600,
//   "order_id": "103",
//   "billing_data": {
//     "apartment": "803",
//     "email": "claudette09@exa.com",
//     "floor": "42",
//     "first_name": "Clifford",
//     "street": "Ethan Land",
//     "building": "8028",
//     "phone_number": "+86(8)9135210487",
//     "shipping_method": "PKG",
//     "postal_code": "01898",
//     "city": "Jaskolskiburgh",
//     "country": "CR",
//     "last_name": "Nicolas",
//     "state": "Utah"
//   },
//   "currency": "EGP",
//   "integration_id": 1
//   "lock_order_when_paid": "false"
// }
//create paymentKeyRequest class using json_serializable
//
//
//
import 'package:json_annotation/json_annotation.dart';

part 'payment_key_request.g.dart';

@JsonSerializable()
class PaymentKeyRequest {
  String? auth_token;
   String? amount_cents;
   String? expiration;
   String? order_id;
//al BillingData billing_data;
   String? currency;
   String? integration_id;
   String? lock_order_when_paid;

  PaymentKeyRequest(
      { this.auth_token,
      this.amount_cents,
      this.expiration,
      this.order_id,
 //  ed this.billing_data,
      this.currency,
      this.integration_id,
      this.lock_order_when_paid});

  factory PaymentKeyRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentKeyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentKeyRequestToJson(this);
}

// import 'package:json_annotation/json_annotation.dart';
//
// part 'billing_data.g.dart';
//
// @JsonSerializable()
// class BillingData {
//   final String apartment;
//   final String email;
//   final String floor;
//   final String first_name;
//   final String street;
//   final String building;
//   final String phone_number;
//   final String shipping_method;
//   final String postal_code;
//   final String city;
//   final String country;
//   final String last_name;
//   final String state;
//
//   BillingData(
//       {required this.apartment,
//       required this.email,
//       required this.floor,
//       required this.first_name,
//       required this.street,
//       required this.building,
//       required this.phone_number,
//       required this.shipping_method,
//       required this.postal_code,
//       required this.city,
//       required this.country,
//       required this.last_name,
//       required this.state});
//
//   factory BillingData.fromJson(Map<String, dynamic> json) =>
//       _$BillingDataFromJson(json);
//   Map<String, dynamic> toJson() => _$BillingDataToJson(this);
// }
//
