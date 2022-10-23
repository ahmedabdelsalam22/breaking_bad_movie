import 'package:breaking_bad_movie/core/constance/text_manager.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  Dio? dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: TextManager.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 30 second
      receiveTimeout: 20 * 1000, // 30 second
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio!.get(TextManager.characters);
      return response.data;
    } catch (error) {
      return [];
    }
  }
}
