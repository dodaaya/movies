import 'package:flutter/material.dart';
import 'package:movies/movie/movie_container.dart';

import '../myTheme.dart';

class SearchMovieDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => showResults(context), icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Container(
          color: MyTheme.black,
          child: Center(child: Image.asset('assets/images/movie.png')));
    }
    return MovieCont(movieName: query); //FutureBuilder<MovieResponse?>(
    //     future: ApiManager.searchMovies(query),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //
    //       var movieList = snapshot.data?.results ?? [];
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return MoviesItem(movies: movieList[index]);
    //         },
    //         itemCount: movieList.length,
    //       );
    //     });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return buildResults(context);
    // return FutureBuilder<MovieResponse?>(
    //     future: ApiManager.searchMovies(query),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text('Something went wrong'),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //
    //       var movieList = snapshot.data?.results ?? [];
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //           return MoviesItem(movies: movieList[index]);
    //         },
    //         itemCount: movieList.length,
    //       );
    //     });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: MyTheme.greyColor
      )
    );
  }
}
