import 'package:flutter/material.dart';
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
        backgroundColor: const Color.fromARGB(255, 135, 173, 204),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: jokeState.fetchJokes,
              child: const Text("Get Jokes"),
            ),
            const SizedBox(height: 20),
            if (jokeState.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (jokeState.jokes.isEmpty)
              const Text("No jokes fetched yet!")
            else
              Expanded(
                child: ListView.builder(
                  itemCount: jokeState.jokes.length,
                  itemBuilder: (context, index) {
                    final joke = jokeState.jokes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              joke.type == 'single'
                                  ? 'Single Joke'
                                  : 'Two-Part Joke',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade700,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              joke.type == 'single'
                                  ? joke.joke!
                                  : '${joke.setup}\n\nDelivery: ${joke.delivery}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                                height: 1.4, // Line height
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
