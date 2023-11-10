import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/MoviesDetails.dart';
import 'package:movies/myTheme.dart';

class Ui extends StatelessWidget {
  Movies result;

  Ui({required this.result});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              result?.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: MyTheme.white),
            ),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(18)),
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500" +
                          result.backdropPath!,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  result.title ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  result.releaseDate ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.lighterGreyColor),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    CachedNetworkImage(
                      height: 150,
                      imageUrl: "https://image.tmdb.org/t/p/w500" +
                          result.posterPath!,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 238,
                      height: 160,
                      child: Text(
                        result.overview ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: MyTheme.white),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}