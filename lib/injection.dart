import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'core/network/paymob_service.dart';
import 'feautres/payment/business_logic/payment_cubit.dart';
import 'feautres/payment/data/PaymentRepository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<PaymobService>(PaymobService(getIt<Dio>()));
  getIt.registerSingleton<PaymentRepository>(PaymentRepository(getIt<PaymobService>()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt<PaymentRepository>()));
}