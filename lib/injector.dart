import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'feature/home_page/presentation/cubit/home_page_cubit.dart';
import 'feature/language/data/data_sources/language_locale_data_source.dart';
import 'feature/language/data/repositories/language_repository.dart';
import 'feature/language/domain/repositories/base_language_repository.dart';
import 'feature/language/domain/use_cases/change_language_use_case.dart';
import 'feature/language/domain/use_cases/get_saved_language_use_case.dart';
import 'feature/language/presentation/cubit/locale_cubit.dart';

// import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features
  // Blocs

  serviceLocator.registerFactory(
    () => LocaleCubit(
      getSavedLanguageUseCase: serviceLocator(),
      changeLanguageUseCase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomePageCubit(),
  );
  //
  // Use Cases
  serviceLocator.registerLazySingleton(
      () => GetSavedLanguageUseCase(languageRepository: serviceLocator()));
  serviceLocator.registerLazySingleton(
      () => ChangeLanguageUseCase(languageRepository: serviceLocator()));
  // Repositories
  serviceLocator.registerLazySingleton<BaseLanguageRepository>(
    () => LanguageRepository(
      languageLocaleDataSource: serviceLocator(),
    ),
  );
  //
  // Data Sources
  serviceLocator.registerLazySingleton<BaseLanguageLocaleDataSource>(
      () => LanguageLocaleDataSource(sharedPreferences: serviceLocator()));
  //
  //! Core
  //Network
  serviceLocator.registerLazySingleton<BaseNetworkInfo>(
      () => NetworkInfo(connectionChecker: serviceLocator()));

  // Api Consumer
  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  // http
  // serviceLocator.registerLazySingleton(() => http.Client());

  // Dio
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton(() => AppInterceptors());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );

  // Internet Connection Checker
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
