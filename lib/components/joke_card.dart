import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final dynamic joke;

  const JokeCard({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
