

import 'dart:convert';

import 'package:http/http.dart'as http;

class MovieService{
  Future<Map<String, dynamic>> fetchTrendingMovies() async {
    final apiKey = "015f7145ab3361c5ad4905db4d2906c2"; // Replace with your actual API key
    final apiUrl = "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      print('API Response: $response');

      print(response.body);
      print('API Response: $response');

      return json.decode(response.body);

    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load trending movies');
    }
  }
  Future<Map<String, dynamic>> fetchTopRatedMovies() async {
    final apiKey = "015f7145ab3361c5ad4905db4d2906c2"; // Replace with your actual API key
    final apiUrl = "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      print(response.body);
      return json.decode(response.body);

    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load toprated movies');
    }
  }
  Future<Map<String, dynamic>> fetchUpComingMovies() async {
    final apiKey = "015f7145ab3361c5ad4905db4d2906c2"; // Replace with your actual API key
    final apiUrl = "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      print(response.body);
      return json.decode(response.body);

    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load Upcoming movies');
    }
  }


}




