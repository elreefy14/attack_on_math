//1. Authentication Request:
//
// The Authentication request is an elementary step you should do before dealing with any of Accept's APIs.
// It is a post request with a JSON object which contains your api_key found in your dashboard - Profile tab.
//
// URL: https://accept.paymob.com/api/auth/tokens
//
// Method: POST
//
// Source: Merchant's server
//
// Recipient: Accept's server
//
// Content-Type: JSON
//
// Example request data:
//
// {
// "api_key": "ZXlKaGJHY2lPaUpJVXpVe..."
// }
//
// Parameter Required Description
// api_key Yes It is a unique identifier for the merchant which used to authenticate your requests calling any of Accept's API.
//
// Example response:
//
// {
// "token": "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJ..."
// }
//
// Parameter Required for the next request Description
// token Yes Authentication token, which is valid for one hour from the creation time.
//
//     Order Registration API
//
// At this step, you will register an order to Accept's database, so that you can pay for it later using a transaction.
// Order ID will be the identifier that you will use to link the transaction(s) performed to your system, as one order can have more than one transaction.
//
// URL: https://accept.paymob.com/api/ecommerce/orders
//
// Method: POST
//
// Source: Merchant's server
//
// Recipient: Accept's server
//
// Content-Type: JSON
//
// Example request data:
//
// {
// "auth_token": "ZXlKaGlPaUpJVXpVeE1pSX1Y0NJmV5Sn...",
// "delivery_needed": "false",
// "amount_cents": "100",
// "currency": "EGP",
// "merchant_order_id": 5,
// "items": [
// {
// "name": "ASC1515",
// "amount_cents": "500000",
// "description": "Smart Watch",
// "quantity": "1"
// },
// {
// "name": "ERT6565",
// "amount_cents": "200000",
// "description": "Power Bank",
// "quantity": "1"
// }
// ],
// "shipping_data": {
// "apartment": "803",
// "email": "claudette09@exa.com",
// "floor": "42",
// "first_name": "Clifford",
// "street": "Ethan Land",
// "building": "8028",
// "phone_number": "+86(8)9135210487",
// "postal_code": "01898",
// "extra_description": "8 Ram , 128 Giga",
// "city": "Jaskolskiburgh",
// "country": "CR",
// "last_name": "Nicolas",
// "state": "Utah"
// },
// "shipping_details": {
// "notes" : " test",
// "number_of_packages": 1,
// "weight" : 1,
// "weight_unit" : "Kilogram",
// "length" : 1,
// "width" :1,
// "height" :1,
// "contents" : "product of some sorts"
// }
// }
//
// Parameter Required Description
// auth_token Yes The authentication token obtained from step 1
// delivery_needed Yes Set it to be true if your order needs to be delivered by Accept's product delivery services.
// amount_cents Yes The price of the order in cents.
// merchant_order_id No A unique alpha-numeric value, example: "E6RR3".
// Discard it from the request if your don't need it.
// items Yes list of objects contains the contents of the order if it is existing, send it as empty array if it is not available. However, Mandatory for Souhoula and GET_GO payment methods.
// shipping_data No Mandatory if your order needs to be delivered, otherwise you can delete the whole object.
// shipping_details No Mandatory if your order needs to be delivered, otherwise you can delete the whole object.
//
// Example response:
//
// {
// "id": 103,
// "created_at": "2017-01-10T05:41:15.700814Z",
// "delivery_needed": "false",
// "merchant": {
// "id": 28,
// "created_at": "2016-11-17T15:02:53.646620Z",
// "phones": [
// "011111111111",
// "012324151432"
// ],
// "company_emails": [
// "brendon42@cummings-windler.biz",
// "jim50@sipes-kunze.com"
// ],
// "company_name": "Wuckert, Zieme and Dach",
// "state": "Oklahoma",
// "country": "Oman",
// "city": "Port Arvillachester",
// "postal_code": "83372",
// "street": "Walker Ramp"
// },
// "collector": "null",
// "amount_cents": 100,
// "shipping_data": {
// "id": 80,
// "first_name": "test",
// "last_name": "account",
// "street": "example",
// "building": "6",
// "floor": "4",
// "apartment": "404",
// "city": "cairo",
// "state": "egypt",
// "country": "egypt",
// "email": "test@example.com",
// "phone_number": "00201000212058",
// "postal_code": "123456",
// "extra_description": "test asdf",
// "shipping_method": "EM",
// "order_id": 103,
// "order": 103
// },
// "currency": "EGP",
// "is_payment_locked": "false",
// "merchant_order_id": "null",
// "wallet_notification": "null",
// "paid_amount_cents": 0,
// "items": []
// }
//
// Parameter Required for the next request Description
// id Yes This is the ID of your order in Accept's database, so you can use this reference to perform any action to this Order.
//
//     Payment Key Request
//
// At this step, you will obtain a payment_key token. This key will be used to authenticate your payment request. It will be also used for verifying your transaction request metadata.
//
// URL: https://accept.paymob.com/api/acceptance/payment_keys
//
// Method: POST
//
// Source: Merchant's server
//
// Recipient: Accept's server
//
// Content-Type: JSON
//
// Example request data:
//
// {
// "auth_token": "ZXlKaGlPaUpJVXpVeE1pSX1Y0NJmV5Sn...",
// "amount_cents": "100",
// "expiration": 3600,
// "order_id": "103",
// "billing_data": {
// "apartment": "803",
// "email": "claudette09@exa.com",
// "floor": "42",
// "first_name": "Clifford",
// "street": "Ethan Land",
// "building": "8028",
// "phone_number": "+86(8)9135210487",
// "shipping_method": "PKG",
// "postal_code": "01898",
// "city": "Jaskolskiburgh",
// "country": "CR",
// "last_name": "Nicolas",
// "state": "Utah"
// },
// "currency": "EGP",
// "integration_id": 1
// "lock_order_when_paid": "false"
// }
//
// 🚧
//
// You might notice that you've sent "amount_cents" before in the Order Registration API.
// The "amount_cents" sent before was the price of the order, as Accept has a wide variety of payment channels, one order can have several transactions through more than one payment channel with different prices.
//
// Parameter Required Description
// auth_token Yes Authentication token obtained from step 1.
// amount_cents Yes The price should be paid through this payment channel with this payment key token.
// expiration Yes The expiration time of this payment token in seconds. (The maximum is 3600 seconds which is an hour)
// order_id Yes The id of the order you want to perform this payment for.
// billing_data Yes The billing data related to the customer related to this payment.
// All the fields in this object are mandatory, you can send any of these information if it isn't available, please send it to be "NA", except, first_name, last_name, email, and phone_number cannot be sent as "NA".
// currency Yes The currency related to this payment.
// integration_id Yes An identifier for the payment channel you want your customer to pay through.
// lock_order_when_paid No A flag prevent this order to be paid again if it is paid.
//
// Sample response:
//
// {
// "token": "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VX..."
// }



import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_apis/feautres/payment/data/order/order_request.dart';
import 'package:youtube_apis/feautres/payment/data/payment/payment_key_request.dart';

import '../data/auth/auth_response.dart';
import '../data/order/order_response.dart';
import '../data/payment/payment_key_response.dart';
import '../repository/PaymentRepository.dart';
import '../data/payment_response.dart';
part 'payment_state.dart';
class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository _paymentRepository;

  PaymentCubit(this._paymentRepository) : super(PaymentInitial());

  Future<void> makePayment(String phoneNumber, String paymentToken) async {
    try {
      emit(PaymentLoading());
      final paymentResponse = await _paymentRepository.makePayment(phoneNumber, paymentToken);
      emit(PaymentSuccess(paymentResponse));
    } catch (e) {

      print(e.toString());
      emit(PaymentError(e.toString()));
    }
  }
  // make authantication then get the authREsponse token and pass it to the register order
  Future<void> authenticate({required String apiKey, amountCents}) async {
    try {
      emit(AuthLoading());
      final authResponse = await _paymentRepository.authenticate(apiKey);
      emit(AuthSuccess(authResponse: authResponse));
      registerOrder(auth_token: authResponse.token);
    } catch (e) {
      print(e.toString());
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
  Future<void> registerOrder({required String auth_token, amountCents}) async {
    try {
      emit(OrderLoading());

      print('hi\n\n\n\n\n\n\n\n');
      OrderResponse orderResponse = await _paymentRepository.registerOrder(
        auth_token: auth_token,
      );
      print('bye\n\n\n\n\n\n\n\n\n');
      emit(OrderSuccess(orderResponse));

    } catch (e) {
      emit(OrderFailure(errorMessage: e.toString()));
    }
  }
  Future<void> getPaymentKey({
    String? auth_token,
    String? amount_cents,
    String? expiration,
    String? order_id,
    String? currency,
    String? integration_id,
    String? lock_order_when_paid,
  }
) async {
    try {
      emit(PaymentKeyLoading());
      PaymentKeyRequest paymentKeyData = PaymentKeyRequest(
          auth_token: auth_token,
          amount_cents: amount_cents?? "100",
          expiration: expiration?? "3600",
          order_id: order_id,
          currency: currency?? "EGP",
          integration_id: integration_id?? "1942078",
          lock_order_when_paid: lock_order_when_paid?? "false",
      );
      PaymentKeyResponse paymentKeyResponse = await _paymentRepository.getPaymentKey(paymentKeyData);
      emit(PaymentKeySuccess(paymentKeyResponse));
      //debug
       print(paymentKeyResponse.toJson());
    } catch (e) {
      emit(PaymentKeyFailure(errorMessage: e.toString()));
    }
  }
}