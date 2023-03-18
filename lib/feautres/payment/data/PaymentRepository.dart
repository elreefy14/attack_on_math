
import 'package:youtube_apis/feautres/payment/data/payment_response.dart';

import '../../../core/network/paymob_service.dart';


class PaymentRepository {
  final PaymobService _paymobService;

  PaymentRepository(this._paymobService);

  Future<PaymentResponse> makePayment(String phoneNumber, String paymentToken) async {
    final requestData = {
      "source": {
        "identifier": phoneNumber,
        "subtype": "WALLET"
      },
      "payment_token": paymentToken
    };
    return await _paymobService.makePayment(requestData);
  }
}