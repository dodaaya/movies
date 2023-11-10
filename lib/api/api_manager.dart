import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/Models/GenreResponse.dart';
import 'package:movies/Models/MoviesResponse.dart';
import 'package:movies/Models/SimillarResponse.dart';
import 'package:movies/api/api_consts.dart';
import 'package:movies/model/NewReleaseResponse.dart';

import '../model/MoviesDetails.dart';
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
  static String authorizationToken="Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZWMwNWIwOWVjOTA3MWE4YWVjYTY2ZjA0YmUxNmQ2YyIsInN1YiI6IjY1Mzk5ZWQwMjgxMWExMDEyYzk4YmYyZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HGd3aSm3hi3cEPy2XG_RYWbPJt6hmTH93whe7hzSu2c";
  static Future<GenreResponse?> getGenresResponse() async {
    //https://api.themoviedb.org/3/genre/movie/list
    try {
      Uri url = Uri.https("api.themoviedb.org", "/3/genre/movie/list");
      var response = await http.get(url, headers: {
        "Authorization":
        authorizationToken
      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print("jsonConverted");
      return GenreResponse.fromJson(json);
    } catch (e) {
      print("something happend");
      throw e;
    }
  }
  static Future<MoviesResponse?> getMoviesResponse(String genreId)async{
    //https://api.themoviedb.org/3/discover/movie
    //https://api.themoviedb.org/3/discover/movie
    try{
      Uri url = Uri.https("api.themoviedb.org","/3/discover/movie",{
        "with_genres":genreId
      });
      var response = await http.get(url, headers: {
        "Authorization":
        authorizationToken
      });
      return MoviesResponse.fromJson(jsonDecode(response.body));
    }
    catch(e){
      print("error occured");
      print(e.toString());
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

  static Future<Movies?> getDetails(String movieId) async {
    Uri url = Uri.https(
      ApiCostants.BaseUrl,
      ApiCostants.DetMovApi + movieId,
    );
    try {
      var response = await http.get(url, headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NWRlNDBmMDE1MjMwMzQzMWE4NzJkZjc2MjExOTk2NyIsInN1YiI6IjY1NDAxOTE5NTA3MzNjMDBjNTM2NGU0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.63VZ2aTvKv2v185XtKAuYhrvGCWx-OQAErv07EL_Dc0',

      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('jsonconverted');
      return Movies.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
  static Future<SimillarResponse?> getSimillar(String movieId) async {
    //https://api.themoviedb.org/3/movie/{movie_id}/similar
    Uri url = Uri.https(
      ApiCostants.BaseUrl,
     "/3/movie/$movieId/similar",
    );
    try {
      var response = await http.get(url, headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NWRlNDBmMDE1MjMwMzQzMWE4NzJkZjc2MjExOTk2NyIsInN1YiI6IjY1NDAxOTE5NTA3MzNjMDBjNTM2NGU0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.63VZ2aTvKv2v185XtKAuYhrvGCWx-OQAErv07EL_Dc0',

      });
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print('jsonconverted');
      return SimillarResponse.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

