import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'core/network/paymob_service.dart';
import 'feautres/payment/business_logic/payment_cubit.dart';
import 'feautres/payment/repository/PaymentRepository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
 // getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(createAndSetupDio()));
  getIt.registerSingleton<PaymentRepository>(PaymentRepository(getIt<ApiClient>()));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt<PaymentRepository>()));
}
Dio createAndSetupDio() {
  final dio = Dio();
//  dio.options.baseUrl = 'https://www.mp3quran.net/api';
  dio.options.connectTimeout = 5000;
  //dio.options.receiveTimeout = 3000;
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    logPrint: (obj) => debugPrint(obj.toString()),
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
  ));
  return dio;
}