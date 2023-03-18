
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../data/PaymentRepository.dart';
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
}