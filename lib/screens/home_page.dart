import 'package:flutter/material.dart';
import 'package:jokeapp/styles/app_styles.dart';
import 'package:provider/provider.dart';
import '../../state/joke_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final jokeState = Provider.of<JokeState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Application'),
        backgroundColor: AppStyles.primaryColor,
      ),
      body: Container(
        padding: AppStyles.screenPadding,
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: jokeState.fetchJokes,
                child: const Text("Get Jokes"),
              ),
            ),
            const SizedBox(height: 20),
            if (jokeState.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (jokeState.jokes.isEmpty)
              const Text("No jokes fetched yet!")
            else
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true, // Show the scrollbar thumb always
                  thickness: 8, // Adjust scrollbar thickness
                  radius: const Radius.circular(8), // Rounded scrollbar
                  child: ListView.builder(
                    itemCount: jokeState.jokes.length,
                    itemBuilder: (context, index) {
                      final joke = jokeState.jokes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '*',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  joke.type == 'single'
                                      ? joke.joke!
                                      : '${joke.setup}\n\n- ${joke.delivery}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
