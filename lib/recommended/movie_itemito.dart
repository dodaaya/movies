import 'package:flutter/material.dart';
import 'package:movies/model/TopRatedResponse.dart';

import '../myTheme.dart';

class MovieItemito extends StatelessWidget {
  Result3 results;

  MovieItemito({required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.greyBorderColor,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: 120,
              height: 105,
              child: Image.network(
                  fit: BoxFit.fill,
                  'https://image.tmdb.org/t/p/w500' + results.posterPath!),
            ),
            Icon(
              Icons.bookmark,
              color: MyTheme.transparentColor,
              size: 39,
            ),
            Container(
              width: 39,
              height: 35,
              child: Icon(
                Icons.add,
                color: MyTheme.white,
                size: 20,
              ),
            ),
          ]),
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyTheme.selectedYellowColor,
                size: 18,
              ),
              Text(
                '${results.voteAverage}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          Container(
            height: 13,
            child: Text(
              results.originalTitle ?? "",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Text(
            results.releaseDate ?? "",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
