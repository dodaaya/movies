import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/new_release/mov_item.dart';

import '../model/NewReleaseResponse.dart';
import '../myTheme.dart';

class Movie_Row_Simillar extends StatelessWidget {
  List<Result> results2;

  Movie_Row_Simillar({required this.results2});

  @override
  Widget build(BuildContext context) {
    print(results2.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: Colors.black,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Simillar',
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
                return MovItem(results: results2[index]);
              },
              itemCount: results2.length,
            ),
          )
        ],
      ),
    );
  }
}
