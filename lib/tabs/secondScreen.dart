import 'package:flutter/material.dart';
import 'package:movies/movie%20detail/movie_details.dart';

class SecondScreen extends StatelessWidget {
  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDetails(),
      ],
    );
  }
}
