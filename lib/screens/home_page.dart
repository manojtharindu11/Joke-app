import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/joke_state.dart';
import '../components/fetch_jokes_button.dart';
import '../components/joke_card.dart';
import '../components/joke_category_dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeState = Provider.of<JokeState>(context);

    return Scaffold(
      body: Column(
        children: [
          // Top background image
          Container(
            width: double.infinity,
            height: 400 * jokeState.sizeRatio,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/laughing_group.jpg'),
                fit: BoxFit.cover,
                opacity: 0.9,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Fetch-Jokes',
                  style: TextStyle(
                    fontSize: 60 * jokeState.sizeRatio,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LobsterTwo-Bold',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(6, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Select the category",
              style: TextStyle(
                  fontFamily: 'LobsterTwo-italic',
                  color: Colors.black87,
                  fontSize: 16),
            ),
          ),
          // Joke Category Dropdown
          JokeCategoryDropdown(jokeState: jokeState),

          // Fetch jokes button
          FetchJokesButton(jokeState: jokeState),

          const SizedBox(height: 20),

          // Show loading indicator if jokes are being fetched
          if (jokeState.isLoading)
            const Center(child: CircularProgressIndicator()),

          // If no jokes fetched
          if (jokeState.jokes.isEmpty && !jokeState.isLoading)
            const Center(
              child: Text(
                "No jokes fetched yet!",
                style: TextStyle(
                    fontFamily: 'Roboto-Regular', color: Colors.black87),
              ),
            ),

          // List of jokes or pull-to-refresh area
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                jokeState.fetchJokes();
              },
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8,
                radius: const Radius.circular(8),
                child: ListView.builder(
                  itemCount: jokeState.jokes.length,
                  itemBuilder: (context, index) {
                    final joke = jokeState.jokes[index];
                    return JokeCard(joke: joke);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
