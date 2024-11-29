import 'package:dio/dio.dart';
import 'package:jokeapp/data/dto/joke_dto.dart';
import 'package:jokeapp/utils/app_constants.dart';

class JokeService {
  final Dio _dio = Dio();

  Future<List<JokeDto>> fetchJokes() async {
    try {
      final response =
          await _dio.get(AppConstants.jokeApiUrl);

      if (response.data['jokes'] != null) {
        return (response.data['jokes'] as List)
            .map((joke) => JokeDto.fromJson(joke))
            .toList();
      }

      return [];
    } catch (e) {
      print("Error fetching jokes: $e");
      return [];
    }
  }
}
