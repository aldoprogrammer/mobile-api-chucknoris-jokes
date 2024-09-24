import 'package:flutter/material.dart';
import 'package:flutter_jokes_api_generator/JokeGenerator/ProviderServices/provider.services.dart';
import 'package:flutter_jokes_api_generator/JokeGenerator/View/joke_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeProviderServices>(
          create: (_) => JokeProviderServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const JokeScreen(),
      ),
    );
  }
}
