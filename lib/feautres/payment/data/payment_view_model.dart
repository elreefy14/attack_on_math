import '../../../injection.dart';
import '../business_logic/payment_cubit.dart';

class PaymentViewModel {
  final PaymentCubit _paymentCubit = getIt<PaymentCubit>();

  Future<void> makePayment(String phoneNumber, String paymentToken) async {
    _paymentCubit.makePayment(phoneNumber, paymentToken);
  }
}
