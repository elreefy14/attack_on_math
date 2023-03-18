import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../registeration/presenation/widget/widget.dart';
import '../../business_logic/payment_cubit.dart';
import '../../data/payment_view_model.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final PaymentViewModel _viewModel = PaymentViewModel();
  final String phoneNumber = "01097051812";
  final String paymentToken = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8yT1RJNE9URjkuajdKSDh3ZnBsUlZhaFpZZDF5anZCVTBIcXcyMDltN0thSThNZEZRTUdFd0xFZm5KR1V6X1NDdEVOSmZKcTR5LXlDRmUwcXMtMzZnbnhrVnI2bXZoN2c=";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        if (state is PaymentLoading) {
          return CircularProgressIndicator();
        } else if (state is PaymentSuccess) {
          showToast(
            msg: 'ouiiiiiiiiio',
            state: ToastStates.SUCCESS,
          );

        } else if (state is PaymentError) {
          showToast(
            msg: 'error',
            state: ToastStates.ERROR,
          );
        } else {
          // Handle initial state
          _viewModel.makePayment(phoneNumber, paymentToken);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Payment'),
          ),
          body: Center(
            child: Text('Payment'),
          ),
        );// Add a default return statement
      },
    );
  }
}
