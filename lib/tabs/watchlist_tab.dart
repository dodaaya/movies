import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/CustomItems/MovieItemForWatchList.dart';
import 'package:movies/Firebase/firebase_utils.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

class WatchListTab extends StatelessWidget {
  static const String routename = 'WatchList';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            "Watch List",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          FutureBuilder<List<Result>?>(
              future: FireBaseUtils.getAllMoviesFromFireStore(),
              builder: (context, snapchot) {
                if (snapchot.data == null) {
                  return Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.3),
                    child: Center(child: CircularProgressIndicator(
                      color: Colors.white,
                    ),),
                  );
                }
                List<Result>? movies = snapchot.data;
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) => MovieItemForWatchList(
                          date: movies?[index].releaseDate,
                          title: movies?[index].title,
                      posterPath: movies?[index].posterPath,vote:movies?[index].voteAverage.toString() ,),
                      separatorBuilder: (context, index) => Container(
                            height: 7,
                            color: Colors.black12,
                          ),
                      itemCount: movies?.length ?? 0),
                );
              }),
        ],
      ),
    );
  }
}
