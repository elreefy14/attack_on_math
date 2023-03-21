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
//AuthLoading
class AuthLoading extends PaymentState {}
//AuthSuccess
class AuthSuccess extends PaymentState {
  final AuthResponse authResponse;

  AuthSuccess({required this.authResponse});
}
//AuthFailure
class AuthFailure extends PaymentState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
//OrderLoading
class OrderLoading extends PaymentState {}
//OrderSuccess
class OrderSuccess extends PaymentState {
  final OrderResponse orderResponse;

  OrderSuccess(this.orderResponse);
}
//OrderFailure
class OrderFailure extends PaymentState {
  final String errorMessage;

  OrderFailure({required this.errorMessage});
}
//PaymentKeyLoading
class PaymentKeyLoading extends PaymentState {}
//PaymentKeySuccess
class PaymentKeySuccess extends PaymentState {
  final PaymentKeyResponse paymentKeyResponse;

  PaymentKeySuccess(this.paymentKeyResponse);
}
//PaymentKeyFailure
class PaymentKeyFailure extends PaymentState {
  final String errorMessage;

  PaymentKeyFailure({required this.errorMessage});
}

