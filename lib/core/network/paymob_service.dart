

import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../feautres/payment/data/payment_response.dart';

part 'paymob_service.g.dart';

@RestApi(
  //https://accept.paymob.com/api/acceptance/payments/pay
  baseUrl: 'https://accept.paymob.com',
)
abstract class PaymobService {
  factory PaymobService(Dio dio, {String baseUrl}) = _PaymobService;

  @POST('/api/acceptance/payments/pay')
  Future<PaymentResponse> makePayment(@Body() Map<String, dynamic> data);
}