import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/CustomItems/MovieItemForWatchList.dart';
import 'package:movies/Firebase/firebase_utils.dart';
import 'package:movies/ListProvider.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatefulWidget {
  static const String routename = 'WatchList';

  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  List<Result>? movies;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ListProvider>(context);
    if (movies == null) {
      prov.geTaskasync();
      movies = prov.movies;
    }
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Text(
            "Watch List",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => MovieItemForWatchList(
                      date: prov.movies?[index].releaseDate,
                      title: prov.movies?[index].title,
                      posterPath: prov.movies?[index].posterPath,
                      vote: prov.movies?[index].voteAverage.toString(),
                      movieId: prov.movies?[index].fbId,
                    ),
                separatorBuilder: (context, index) => Container(
                      height: 7,
                      color: Colors.black12,
                    ),
                itemCount: prov.movies?.length ?? 0),
          )
        ]));
  }
}
// FutureBuilder<List<Result>?>(
// future: prov.geTaskasync(),
// builder: (context, snapchot) {
// if (snapchot.data == null) {
// return Padding(
// padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.3),
// child: Center(child: CircularProgressIndicator(
// color: Colors.white,
// ),),
// );
// }
// List<Result>? movies = prov.movies;
// return Expanded(
// child: ListView.separated(
// itemBuilder: (context, index) => MovieItemForWatchList(
// date: movies?[index].releaseDate,
// title: movies?[index].title,
// posterPath: movies?[index].posterPath,vote:movies?[index].voteAverage.toString() ,
// movieId: movies?[index].fbId,
// getTasks: (){
// FireBaseUtils.getAllMoviesFromFireStore();
// setState(() {
//
// });
// },),
// separatorBuilder: (context, index) => Container(
// height: 7,
// color: Colors.black12,
//
// ),
// itemCount: movies?.length ?? 0),
// );
// }),
