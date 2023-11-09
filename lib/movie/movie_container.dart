import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

import '../api/api_manager.dart';
import '../model/SearchResponse.dart';
import 'movies_items.dart';

class MovieCont extends StatelessWidget {
  // List<Result> resultsList;
  String movieName;

  MovieCont({
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResponse?>(
        future: ApiManager.searchMovies(movieName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data?.success == false) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          List<Result> movieList = snapshot.data?.results ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return MoviesItem(result: movieList[index]);
            },
            itemCount: movieList.length,
          );
        });
    // return CarouselSlider.builder(
    //     options: CarouselOptions(height: 400.0),
    //     itemCount: resultsList.length,
    //     itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
    //         Stack(
    //           children: [
    //             Image.network(
    //               'https://image.tmdb.org/t/p/w500' +
    //                   resultsList[itemIndex].backdropPath!,
    //             ),
    //             Container(
    //                 height: MediaQuery.of(context).size.height * 0.20,
    //                 alignment: Alignment.center,
    //                 child: Icon(
    //                   Icons.play_circle,
    //                   color: MyTheme.white,
    //                   size: 80,
    //                 )),
    //             Container(
    //                 height: MediaQuery.of(context).size.height * 0.42,
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(top: 60),
    //                   child: Stack(
    //                     children: [
    //                       Image.network(
    //                         'https://image.tmdb.org/t/p/w500' +
    //                             resultsList[itemIndex].posterPath!,
    //                       ),
    //                       Icon(
    //                         Icons.bookmark,
    //                         color: MyTheme.transparentColor,
    //                         size: 39,
    //                       ),
    //                       Container(
    //                         width: 39,
    //                         height: 35,
    //                         child: Icon(
    //                           Icons.add,
    //                           color: MyTheme.white,
    //                           size: 20,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )),
    //             Container(
    //               width: MediaQuery.of(context).size.width * 0.8,
    //               height: MediaQuery.of(context).size.height * 0.33,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.stretch,
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 165),
    //                     child: Text(
    //                       resultsList[itemIndex].title ?? "",
    //                       style: Theme.of(context)
    //                           .textTheme
    //                           .titleMedium!
    //                           .copyWith(color: MyTheme.white),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 165),
    //                     child: Text(
    //                       resultsList[itemIndex].releaseDate ?? "",
    //                       style: Theme.of(context)
    //                           .textTheme
    //                           .titleSmall!
    //                           .copyWith(color: MyTheme.lighterGreyColor),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ));
  }
}
