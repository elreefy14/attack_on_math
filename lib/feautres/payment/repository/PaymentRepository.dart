
import 'package:youtube_apis/feautres/payment/data/order/order_request.dart';
import 'package:youtube_apis/feautres/payment/data/order/order_response.dart';
import 'package:youtube_apis/feautres/payment/data/payment/payment_key_response.dart';
import 'package:youtube_apis/feautres/payment/data/payment_response.dart';

import '../../../core/network/paymob_service.dart';
import '../data/auth/auth_request.dart';
import '../data/auth/auth_response.dart';
import '../data/payment/payment_key_request.dart';


class PaymentRepository {
  final ApiClient _apiClient;

  PaymentRepository(this._apiClient);

  Future<PaymentResponse> makePayment(String phoneNumber, String paymentToken) async {
    final requestData = {
      "source": {
        "identifier": phoneNumber,
        "subtype": "WALLET"
      },
      "payment_token": paymentToken
    };
    return await _apiClient.makePayment(requestData);
  }

  Future<AuthResponse> authenticate(String apiKey) async {
    final authRequest = {
      "api_key": apiKey,
    };
    return await _apiClient.authenticate(authRequest);
  }

  Future<OrderResponse> registerOrder({
    required String auth_token,
     amountCents,
  }) async {
    try {
      final orderData = OrderRequest(
        auth_token: auth_token,
        amount_cents: '100',
        currency: "EGP",
        delivery_needed: 'false',
        merchant_order_id: 12267472435,
      );
      final response = await _apiClient.createOrder(orderData.toJson());
      return response;
    } catch (e) {
      print('error in register order: reppoooooooooooo\n\n\n\n ');
      print(e.toString());
      throw e;
    }
  }

  Future<PaymentKeyResponse> getPaymentKey(PaymentKeyRequest paymentKeyData) async {
    final response = await _apiClient.createPaymentKey(paymentKeyData);
    return response;
  }
}