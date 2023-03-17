import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dd360_challenge/models/models.dart';
import 'package:dd360_challenge/core/utils/http_provider.dart';

import 'hero_interface.dart';

@injectable
class HeroInterfaceImpl implements HeroInterface {
  final HttpBaseProvider _httpBaseProvider;

  HeroInterfaceImpl(this._httpBaseProvider);

  @override
  Future<MarvelResponseModel> getHeros(int offset) async {
    final Response response = await _httpBaseProvider.get(
      '/characters',
      queryParameters: {"offset": offset},
    );

    if (response.statusCode == 200 && response.data != null) {
      return MarvelResponseModel.fromJson(response.data);
    }
    return const MarvelResponseModel();
  }
}
