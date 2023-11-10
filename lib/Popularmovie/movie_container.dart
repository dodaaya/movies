import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/Popularmovie/Movie_item.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

import '../tabs/secondScreen.dart';

class MovieCont extends StatelessWidget {
  List<Result> resultsList;

  MovieCont({required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(height: 238.0),
      itemCount: resultsList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, SecondScreen.routeName,
                    arguments: resultsList?[itemIndex].id);
              },
              child: MovieItem(results: resultsList[itemIndex])),
    );
  }
}
