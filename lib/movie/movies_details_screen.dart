import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

class MoviesDetailsScreen extends StatelessWidget {
  static const String routeName = 'movies-details';

  @override
  Widget build(BuildContext context) {
    var movies = ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              // child: CachedNetworkImage(
              //   imageUrl: movies.?? "",
              //     placeholder: (context, url) => Center(
              //         child: CircularProgressIndicator(
              //           color: Theme.of(context).primaryColor,
              //         )),
              //     errorWidget: (context, url, error) => Icon(Icons.error),
              //   ),
              // // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   movies.author ?? "",
              //   style: Theme.of(context)
              //       .textTheme
              //       .titleSmall!
              //       .copyWith(color: MyTheme.greyColor),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(movies.title ?? "",
              //     style: Theme.of(context).textTheme.titleMedium),
              // SizedBox(
              //   height: 10,
              // ),
              // // Text(movies.content ?? ""),
              // // SizedBox(
              // //   height: 10,
              // // ),
              // Text(
              //   movies.publishedAt ?? "",
              //   style: Theme.of(context)
              //       .textTheme
              //       .titleSmall!
              //       .copyWith(color: MyTheme.greyColor),
              //   textAlign: TextAlign.end,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              //],
            ),
          ],
        ),
      ),

      //),
    );
  }
}
