import 'package:get_it/get_it.dart';
import 'package:musium/core/data/sources/local/shared_storage.dart';
import 'package:musium/core/router/app_router.dart';

class AppDependencies {
  AppDependencies._();

  static final GetIt instance = GetIt.I;

  static void init() {
    _registerStorages();
    _registerRoute();
  }

  static void _registerStorages() {
    instance.registerSingletonAsync<SharedStorage>(() => SharedStorageImpl.init());
  }

  static void _registerRoute() {
    instance.registerSingletonWithDependencies<AppRouter>(() => AppRouter(instance<SharedStorage>()), dependsOn: [SharedStorage]);
  }
}