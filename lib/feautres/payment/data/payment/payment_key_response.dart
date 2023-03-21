
//{
//     "token": "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VX..."
// }
//create paymentkeyresponse class using json_serializable
 //


import 'package:json_annotation/json_annotation.dart';

part 'payment_key_response.g.dart';

@JsonSerializable()
class PaymentKeyResponse {
  final String token;

  PaymentKeyResponse({required this.token});

  factory PaymentKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentKeyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentKeyResponseToJson(this);
}

//