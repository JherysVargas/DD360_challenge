import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'generate_md5.dart';

@injectable
class HttpBaseProvider {
  HttpBaseProvider(this._dio, this._logger);

  final Dio _dio;
  final Logger _logger;

  String get _baseUrl => dotenv.env['baseUrl']!;
  String get _publicKey => dotenv.env['publicKey']!;
  String get _privateKey => dotenv.env['privateKey']!;

  Map<String, dynamic>? _generateQueryParameters(
    Map<String, dynamic> queryParameters,
  ) {
    final timeStamp = DateTime.now().millisecondsSinceEpoch;

    final hashMD5 = GenerateHash.generateMD5(
      timeStamp: timeStamp,
      publicKey: _publicKey,
      privateKey: _privateKey,
    );

    return {
      "apikey": _publicKey,
      "hash": hashMD5,
      "ts": timeStamp,
      "limit": 40,
      ...queryParameters,
    };
  }

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      final Response response = await _dio.get(
        "$_baseUrl/$endpoint",
        queryParameters: _generateQueryParameters(queryParameters),
      );
      _logger.i(response.statusCode);
      return response;
    } on DioError catch (e) {
      _logger.e(e.response!.statusCode);
      return e.response!;
    }
  }
}
