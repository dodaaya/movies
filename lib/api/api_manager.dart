import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/api/api_consts.dart';
import 'package:movies/model/NewReleaseResponse.dart';

import '../model/PopularMoviesResponse.dart';
import '../model/TopRatedResponse.dart';

class ApiManager {
  // https://api.themoviedb.org/3/movie/popular?apikey=cd9985046f0b273b29fbc67195cca68e
  static Future<PopularMoviesResponse?> getPopMov() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.popMovApi, {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww',
    });
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww'
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('jsonconverted');
      return PopularMoviesResponse.fromJson(json);
    } catch (e) {
      print('sth wrong');
      throw e;
    }
  }

  //https://api.themoviedb.org/3/movie/upcoming
  static Future<NewReleaseResponse?> getNewReleaseMov() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.newReleaseMovApi, {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww',
    });
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww',
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('jsonconverted');
      return NewReleaseResponse.fromJson(json);
    } catch (e) {
      print('sth wrong');
      throw e;
    }
  }

  //https://api.themoviedb.org/3/movie/top_rated
  static Future<TopRatedResponse?> getRecommendedMov() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.RecommMovApi, {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww',
    });
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZDk5ODUwNDZmMGIyNzNiMjlmYmM2NzE5NWNjYTY4ZSIsInN1YiI6IjY1MzkxOTY0YWUzNjY4MDBlYTljZWE2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y3WNBPUesRM3hmK1h9Cc05dWax8kcpHgZ2dSxLYfKww'
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('jsonconverted');
      return TopRatedResponse.fromJson(json);
    } catch (e) {
      print('sth wrong');
      throw e;
    }
  }
}
