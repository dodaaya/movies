import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/recommended/movie_itemito.dart';

import '../myTheme.dart';

class MovieList extends StatelessWidget {
  List<Result> results;

  MovieList({required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: MyTheme.greyColor,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MovieItemito(
                  results: results[index],
                );
              },
              itemCount: results.length,
            ),
          )
        ],
      ),
    );
  }
}
