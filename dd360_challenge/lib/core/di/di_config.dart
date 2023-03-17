import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

import 'di_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDIDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {
  @Named("BaseUrl")
  String get baseUrl => '';

  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));
}
