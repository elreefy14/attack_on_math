


import 'package:json_annotation/json_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  final String auth_token;
  final String delivery_needed;
  final String amount_cents;
  final String currency;
  final int merchant_order_id;

  OrderRequest(
      {required this.auth_token,
      required this.delivery_needed,
      required this.amount_cents,
      required this.currency,
      required this.merchant_order_id});

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
