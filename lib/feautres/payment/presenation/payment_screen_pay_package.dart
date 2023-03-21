import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayScreen extends StatefulWidget {
  const GooglePayScreen({Key? key}) : super(key: key);

  @override
  State<GooglePayScreen> createState() => _GooglePayScreenState();
}

class _GooglePayScreenState extends State<GooglePayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pay'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GooglePayButton(
                paymentConfigurationAsset: JsonAssets.gpayAsset,
                paymentItems: paymentItems,
                onPaymentResult: onGooglePayResult,
                // style: GooglePayButtonStyle.white,
                margin: const EdgeInsets.only(top: 15.0),
                width: double.maxFinite,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PaymentItem> get paymentItems {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '1.00',
        status: PaymentItemStatus.final_price,
      ),
    ];

    return _paymentItems;
  }

  void onGooglePayResult(dynamic paymentResult) {
    debugPrint(paymentResult.toString());
  }
}

class JsonAssets {
  JsonAssets._();

  static const String gpayAsset =
        'gpay.json';
}
//can you show me how to implement vodafone cash payment logic .
//what is vodafone cash api and integration process
//iwant to add new payment method which is vodafone cash . can you edit payment screen and give me vodafone.json file .this is my flutter payment screen using package called pay package .import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class GooglePayScreen extends StatefulWidget {
// const GooglePayScreen({Key? key}) : super(key: key);
//
// @override
// State<GooglePayScreen> createState() => _GooglePayScreenState();
// }
//
// class _GooglePayScreenState extends State<GooglePayScreen> {
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(
// title: const Text('Google Pay'),
// ),
// body: Container(
// margin: EdgeInsets.symmetric(horizontal: 15),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// child: GooglePayButton(
// paymentConfigurationAsset: JsonAssets.gpayAsset,
// paymentItems: paymentItems,
// onPaymentResult: onGooglePayResult,
// // style: GooglePayButtonStyle.white,
// margin: const EdgeInsets.only(top: 15.0),
// width: double.maxFinite,
// loadingIndicator: const Center(
// child: CircularProgressIndicator(),
// ),
// ),
// ),
// ],
// ),
// ),
// );
// }
//
// List<PaymentItem> get paymentItems {
// const _paymentItems = [
// PaymentItem(
// label: 'Total',
// amount: '1.00',
// status: PaymentItemStatus.final_price,
// ),
// ];
//
// return _paymentItems;
// }
//
// void onGooglePayResult(dynamic paymentResult) {
// debugPrint(paymentResult.toString());
// }
// }
//
// class JsonAssets {
// JsonAssets._();
//
// static const String gpayAsset =
// 'gpay.json';
// } . this is my gpay.json . {
// "provider": "google_pay",
// "data": {
// "environment": "TEST",
// "apiVersion": 2,
// "apiVersionMinor": 0,
// "allowedPaymentMethods": [
// {
// "type": "CARD",
// "tokenizationSpecification": {
// "type": "PAYMENT_GATEWAY",
// "parameters": {
// "gateway": "example",
// "gatewayMerchantId": "gatewayMerchantId"
// }
// },
// "parameters": {
// "allowedCardNetworks": ["VISA", "MASTERCARD"],
// "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
// "billingAddressRequired": true,
// "billingAddressParameters": {
// "format": "FULL",
// "phoneNumberRequired": true
// }
// }
// }
// ],
// "merchantInfo": {
// "merchantId": "2536-4579-4516",
// "merchantName": "A plus"
// },
// "transactionInfo": {
// "countryCode": "US",
// "currencyCode": "USD"
// }
// }
// }