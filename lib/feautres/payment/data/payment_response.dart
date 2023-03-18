import 'package:json_annotation/json_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class PaymentResponse {
  final int id;
  @JsonKey(name: 'pending')
  final String isPending;
  final int amount_cents;
  @JsonKey(name: 'success')
  final String isSuccess;
  // ... other fields

  PaymentResponse({
    required this.id,
    required this.isPending,
    required this.amount_cents,
    required this.isSuccess,
    // ... other fields
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
