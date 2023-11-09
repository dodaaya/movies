import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/CustomItems/ui.dart';
import 'package:movies/api/api_manager.dart';


import '../model/Movies.dart';

class MovieDetails extends StatelessWidget {
Movies movies;
MovieDetails({required this.movies});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies?>(
        future: ApiManager.getsources(movies.id.toString()),
        builder: (_,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme
                    .of(context)
                    .primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(" something went wrong"),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }
          return MovieItem(movies: movies);
        });
  }
}
