import 'package:flutter/material.dart';
import 'package:movies/Firebase/firebase_utils.dart';
import 'package:movies/model/NewReleaseResponse.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

import '../myTheme.dart';

class MovItem extends StatelessWidget {
  Result results;

  MovItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
        height: 200,
        'https://image.tmdb.org/t/p/w500' + results.posterPath!,
      ),
      Icon(
        Icons.bookmark,
        color: MyTheme.transparentColor,
        size: 39,

        //icon: Icon(Icons.bookmark,size: 30,),
      ),
      InkWell(
        onTap: (){
          FireBaseUtils.addMovie(results);
        },
        child: Container(
          width: 39,
          height: 35,
          child: Icon(
            Icons.add,
            color: MyTheme.white,
            size: 20,
          ),
        ),
      ),
    ]);
  }
}
