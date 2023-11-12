import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/PopularMoviesResponse.dart';
import '../myTheme.dart';
import 'movies_details_screen.dart';

class MoviesItem extends StatelessWidget {
  Result result;

  MoviesItem({required this.result});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(MoviesDetailsScreen.routeName, arguments: result),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500" +
                    "${result.posterPath ?? ""}",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              result.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(result.originalLanguage ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 10,
            ),
            Text(
              result.releaseDate ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: MyTheme.greyColor),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
