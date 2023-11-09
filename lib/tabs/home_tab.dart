import 'package:flutter/material.dart';
import 'package:movies/Popularmovie/popular_movie.dart';
import 'package:movies/new_release/new_release_movie.dart';
import 'package:movies/recommended/recommended_movie.dart';

class HomeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularMovie(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        NewRelease(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        RecommendedMovie()
      ],
    );
  }
}
