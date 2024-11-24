import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Application'),
        backgroundColor: const Color.fromARGB(255, 135, 173, 204),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding if needed
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Button takes full width
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Clicked button");
                },
                child: Text("Get Jokes")),
            Column(
              children: [Text("data")],
            )
          ],
        ),
      ),
    );
  }
}
