import 'package:demo_project/scoped_models/error_model.dart';
import 'package:demo_project/scoped_models/home_model.dart';
import 'package:demo_project/scoped_models/success_model.dart';
import 'package:demo_project/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<StorageService>(() => StorageService());

  // Register models
  locator.registerFactory<HomeModel>(() => HomeModel());
  locator.registerFactory<ErrorModel>(() => ErrorModel());
  locator.registerFactory<SuccessModel>(() => SuccessModel());
}
