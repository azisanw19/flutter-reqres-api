import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:reqres/src/data/cache/cache.dart';
import 'package:reqres/src/data/data_source/reqres_api_service.dart';
import 'package:reqres/src/data/repository/user_repository_impl.dart';
import 'package:reqres/src/domain/repository/auth_repository.dart';
import 'package:reqres/src/domain/repository/user_repository.dart';
import 'package:reqres/src/utils/network/connectivity_manager.dart';

import 'data/repository/auth_repository_impl.dart';

void initializeDependencies() {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  Get.put<Dio>(dio);

  Get.put<ReqresApiService>(ReqresApiService(Get.find<Dio>()));

  Get.put<UserRepository>(UserRepositoryImpl(Get.find<ReqresApiService>()));

  Get.put<ConnectivityManager>(ConnectivityManager());

  Get.put<AuthRepository>(AuthRepositoryImpl(Get.find<ReqresApiService>()));

  Get.put<UserRepository>(UserRepositoryImpl(Get.find<ReqresApiService>()));

  Get.put(Cache());
}
