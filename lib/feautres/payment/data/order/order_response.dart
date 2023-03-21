//class Test14 {
//   Test14({
//       this.id,
//       this.createdAt,
//       this.deliveryNeeded,
//       this.collector,
//       this.amountCents,
//       this.shippingData,
//       this.currency,
//       this.isPaymentLocked,
//       this.isReturn,
//       this.isCancel,
//       this.isReturned,
//       this.isCanceled,
//       this.merchantOrderId,
//       this.walletNotification,
//       this.paidAmountCents,
//       this.notifyUserWithEmail,
//       this.items,
//       this.orderUrl,
//       this.commissionFees,
//       this.deliveryFeesCents,
//       this.deliveryVatCents,
//       this.paymentMethod,
//       this.merchantStaffTag,
//       this.apiSource,
//       this.data,
//       this.token,
//       this.url,});
//
//   Test14.fromJson(dynamic json) {
//     id = json['id'];
//     createdAt = json['created_at'];
//     deliveryNeeded = json['delivery_needed'];
//     collector = json['collector'];
//     amountCents = json['amount_cents'];
//     shippingData = json['shipping_data'];
//     currency = json['currency'];
//     isPaymentLocked = json['is_payment_locked'];
//     isReturn = json['is_return'];
//     isCancel = json['is_cancel'];
//     isReturned = json['is_returned'];
//     isCanceled = json['is_canceled'];
//     merchantOrderId = json['merchant_order_id'];
//     walletNotification = json['wallet_notification'];
//     paidAmountCents = json['paid_amount_cents'];
//     notifyUserWithEmail = json['notify_user_with_email'];
//     if (json['items'] != null) {
//       items = [];
//       json['items'].forEach((v) {
//         items?.add(Dynamic.fromJson(v));
//       });
//     }
//     orderUrl = json['order_url'];
//     commissionFees = json['commission_fees'];
//     deliveryFeesCents = json['delivery_fees_cents'];
//     deliveryVatCents = json['delivery_vat_cents'];
//     paymentMethod = json['payment_method'];
//     merchantStaffTag = json['merchant_staff_tag'];
//     apiSource = json['api_source'];
//     data = json['data'];
//     token = json['token'];
//     url = json['url'];
//   }
//   int? id;
//   String? createdAt;
//   bool? deliveryNeeded;
//   dynamic collector;
//   int? amountCents;
//   dynamic shippingData;
//   String? currency;
//   bool? isPaymentLocked;
//   bool? isReturn;
//   bool? isCancel;
//   bool? isReturned;
//   bool? isCanceled;
//   String? merchantOrderId;
//   dynamic walletNotification;
//   int? paidAmountCents;
//   bool? notifyUserWithEmail;
//   List<dynamic>? items;
//   String? orderUrl;
//   int? commissionFees;
//   int? deliveryFeesCents;
//   int? deliveryVatCents;
//   String? paymentMethod;
//   dynamic merchantStaffTag;
//   String? apiSource;
//   dynamic data;
//   String? token;
//   String? url;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['created_at'] = createdAt;
//     map['delivery_needed'] = deliveryNeeded;
//     map['collector'] = collector;
//     map['amount_cents'] = amountCents;
//     map['shipping_data'] = shippingData;
//     map['currency'] = currency;
//     map['is_payment_locked'] = isPaymentLocked;
//     map['is_return'] = isReturn;
//     map['is_cancel'] = isCancel;
//     map['is_returned'] = isReturned;
//     map['is_canceled'] = isCanceled;
//     map['merchant_order_id'] = merchantOrderId;
//     map['wallet_notification'] = walletNotification;
//     map['paid_amount_cents'] = paidAmountCents;
//     map['notify_user_with_email'] = notifyUserWithEmail;
//     if (items != null) {
//       map['items'] = items?.map((v) => v.toJson()).toList();
//     }
//     map['order_url'] = orderUrl;
//     map['commission_fees'] = commissionFees;
//     map['delivery_fees_cents'] = deliveryFeesCents;
//     map['delivery_vat_cents'] = deliveryVatCents;
//     map['payment_method'] = paymentMethod;
//     map['merchant_staff_tag'] = merchantStaffTag;
//     map['api_source'] = apiSource;
//     map['data'] = data;
//     map['token'] = token;
//     map['url'] = url;
//     return map;
//   }
//
// } make the same class with json_serializable



import 'package:json_annotation/json_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse {
  OrderResponse({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.data,
    this.token,
    this.url,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  int? id;
  String? createdAt;
  bool? deliveryNeeded;
  dynamic collector;
  int? amountCents;
  dynamic shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  String? merchantOrderId;
  dynamic walletNotification;
  int? paidAmountCents;
  bool? notifyUserWithEmail;
  List<dynamic>? items;
  String? orderUrl;
  int? commissionFees;
  int? deliveryFeesCents;
  int? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  dynamic data;
  String? token;
  String? url;
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

// Path: lib/feautres/payment/data/order/dynamic.dart
//class Dynamic {
//   Dynamic({
//       this.id,
//       this.name,
//       this.priceCents,
//       this.quantity,
//       this.sku,
//       this.type,
//       this.totalPriceCents,
//       this.description});
//
//   Dynamic.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     priceCents = json['price_cents'];
//     quantity = json['quantity'];
//     sku = json['sku'];
//     type = json['type'];
//     totalPriceCents = json['