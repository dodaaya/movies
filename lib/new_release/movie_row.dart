import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/new_release/mov_item.dart';

import '../myTheme.dart';

class MovieRow extends StatelessWidget {
  List<Result> results2;

  MovieRow({required this.results2});

  @override
  Widget build(BuildContext context) {
    print(results2.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: MyTheme.greyColor,
      padding: EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Releases',
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
      ),
    );
  }
}
