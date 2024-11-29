import 'package:flutter/material.dart';
import 'package:jokeapp/data/dto/joke_dto.dart';
import 'package:jokeapp/services/joke_service.dart';

class JokeState extends ChangeNotifier {
  final JokeService _jokeService = JokeService();
  List<JokeDto> jokes = [];
  bool isLoading = false;

  Future<void> fetchJokes() async {
    isLoading = true;
    notifyListeners();

    jokes = await _jokeService.fetchJokes();

    isLoading = false;
    notifyListeners();
  }
}
