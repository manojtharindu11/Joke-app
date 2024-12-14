import 'package:flutter/material.dart';
import 'package:fetch_jokes/data/dto/joke_dto.dart';
import 'package:fetch_jokes/services/joke_service.dart';
import 'package:fetch_jokes/services/cache_manager.dart';

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

  // Fetch jokes from the service based on the selected category or use cache
  Future<void> fetchJokes() async {
    isLoading = true;
    jokes = [];
    notifyListeners();

    // Check if there's an internet connection (assuming you have a method to check it)
    // If there's no internet, use cached jokes
    if (await _isConnected()) {
      // Fetch jokes from API
      jokes = await _jokeService.fetchJokes(category: selectedCategory);
      if (jokes.isNotEmpty) {
        // Cache the jokes after fetching
        await CacheManager.saveJokes(selectedCategory, jokes);
      }
    } else {
      // Use cached jokes if no internet
      jokes = await CacheManager.getJokes(selectedCategory);
    }

    if (jokes.isNotEmpty) {
      sizeRatio = 0.5;
    }

    isLoading = false;
    notifyListeners();
  }

  // Placeholder method to check internet connection
  Future<bool> _isConnected() async {
    // You can use packages like 'connectivity_plus' to check for internet connection
    // Return true if connected, false if not
    return false; // For now, assuming always connected
  }
}
