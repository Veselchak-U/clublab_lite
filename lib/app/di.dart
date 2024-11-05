import 'package:clublab_lite/app/navigation/app_navigation_observer.dart';
import 'package:get_it/get_it.dart';

class DI {
  static final _sl = GetIt.instance;

  static T get<T extends Object>() => _sl<T>();

  void init() {
    _services();
    _dataSources();
    _repositories();
    _businessLogic();
    _providers();
  }

  void _services() {
    // _sl.registerSingleton<StorageService>(StorageServiceImpl());
    // _sl.registerSingleton<SecureStorageService>(SecureStorageServiceImpl());
    _sl.registerSingleton<AppNavigationObserver>(AppNavigationObserver());
    //
    // _sl.registerSingleton<ApiClient>(ApiClient(
    //   headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //     HttpHeaders.acceptHeader: "application/json",
    //   },
    //   interceptors: [
    //     HttpAuthInterceptor(
    //       getAccessToken: () => _sl<UserLocalDatasource>().getAccessToken(),
    //       setAccessToken: (value) => _sl<UserLocalDatasource>().setAccessToken(value),
    //       goLoginScreen: () => AppNavigation.goToScreen(name: AppRoute.login.name),
    //     ),
    //     const HttpLogInterceptor(),
    //     const HttpErrorInterceptor(),
    //   ],
    // ));
    //
    // _sl.registerSingleton<DioApiClient>(DioApiClient(
    //   getAccessToken: () => _sl<UserLocalDatasource>().getAccessToken(),
    // ));
  }

  void _dataSources() {
    // _sl.registerLazySingleton<UserLocalDatasource>(() => UserLocalDatasourceImpl(
    //       _sl<StorageService>(),
    //       _sl<SecureStorageService>(),
    //     ));
  }

  void _repositories() {
    // _sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
    //       _sl<UserLocalDatasource>(),
    //     ));
  }

  void _businessLogic() {}

  void _providers() {}
}
