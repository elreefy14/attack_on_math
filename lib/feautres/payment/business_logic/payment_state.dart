part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
//PaymentLoading
class PaymentLoading extends PaymentState {}
//PaymentSuccess
class PaymentSuccess extends PaymentState {
  final PaymentResponse paymentResponse;

  PaymentSuccess(this.paymentResponse);
}
//PaymentError
class PaymentError extends PaymentState {
  final String message;

  PaymentError(this.message);
}
