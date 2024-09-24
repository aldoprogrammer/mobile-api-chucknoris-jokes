import 'package:flutter/material.dart';
import 'package:flutter_jokes_api_generator/JokeGenerator/ProviderServices/provider.services.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Joke Generator'),
      ),
      body:
          Consumer<JokeProviderServices>(builder: (context, jokeController, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (jokeController.jokes != null) ...[
                  Image.network(jokeController.jokes!.iconUrl),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    jokeController.jokes!.value,
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    jokeController.getData();
                  },
                  child: Text(jokeController.jokes == null
                      ? "Start Reading Jokes"
                      : "Next Jokes"),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
