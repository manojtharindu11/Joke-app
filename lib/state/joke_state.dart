import 'package:flutter/material.dart';
import 'package:jokeapp/data/dto/joke_dto.dart';
import 'package:jokeapp/services/joke_service.dart';

class JokeState extends ChangeNotifier {
  final JokeService _jokeService = JokeService();
  List<JokeDto> jokes = [];
  bool isLoading = false;
  String selectedCategory =
      'Programming'; // Default category set to 'Programming'
  double sizeRatio = 1;

  // Method to update the selected joke category
  void updateSelectedCategory(String? newCategory) {
    if (newCategory != null) {
      selectedCategory = newCategory;
      notifyListeners();
    }
  }

  // Fetch jokes from the service based on the selected category
  Future<void> fetchJokes() async {
    isLoading = true;
    jokes = [];
    notifyListeners();

    jokes = await _jokeService.fetchJokes(
        category: selectedCategory); // Pass category to fetch jokes
    if (jokes.isNotEmpty) {
      sizeRatio = 0.5;
    }

    isLoading = false;
    notifyListeners();
  }
}
