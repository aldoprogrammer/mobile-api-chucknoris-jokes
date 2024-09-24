// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jokes_api_generator/JokeGenerator/Model/model.dart';
import 'package:http/http.dart' as http;

class JokeProviderServices extends ChangeNotifier {
  RandomJokes? _jokes;
  RandomJokes? get jokes => _jokes;
  Future<void> getData() async {
    var url = "https://api.chucknorris.io/jokes/random";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _jokes = RandomJokes.fromJson(data);
        notifyListeners();
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
