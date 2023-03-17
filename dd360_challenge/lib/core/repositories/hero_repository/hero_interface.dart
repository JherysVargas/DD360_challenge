import 'package:dd360_challenge/models/comic_model/marvel_response_model.dart';

abstract class HeroInterface {
  Future<MarvelResponseModel> getHeros(int offset);
}
