// import 'package:flutter/material.dart';
// import 'package:pay/pay.dart';
//
// class VodafoneCashButton extends StatelessWidget implements PayButton {
//   final String paymentConfigurationAsset;
//   final List<PaymentItem> paymentItems;
//   final PaymentResultCallback onPaymentResult;
//   final String phoneNumber;
//
//   const VodafoneCashButton({
//     Key? key,
//     required this.paymentConfigurationAsset,
//     required this.paymentItems,
//     required this.onPaymentResult,
//     required this.phoneNumber,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PaymentButton(
//       paymentConfigurationAsset: paymentConfigurationAsset,
//       paymentItems: paymentItems,
//       onPaymentResult: onPaymentResult,
//       onPaymentMethodSelected: onPaymentMethodSelected,
//     );
//   }
//
//   @override
//   void onPaymentMethodSelected(PaymentMethod paymentMethod) {
//     if (paymentMethod.supportedMethods == 'vodafone_cash') {
//       Pay.startVodafoneCashPayment(
//         paymentMethod: paymentMethod,
//         paymentItems: paymentItems,
//         phoneNumber: phoneNumber,
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Vodafone Cash is not supported by the browser.'),
//         ),
//       );
//     }
//   }
// }
