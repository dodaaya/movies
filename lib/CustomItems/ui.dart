import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/Movies.dart';
import 'package:movies/myTheme.dart';

class MovieItem extends StatelessWidget {
  Movies movies ;

  MovieItem({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(movies?.title ?? "",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge!
              .copyWith(
              color: MyTheme.white),

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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18)
                ),
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: movies.backdropPath ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator(
                          color: Theme
                              .of(context)
                              .primaryColor,
                        )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Text(movies.title ?? "",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(
                    color: MyTheme.white
                ),
              ),
              SizedBox(height: 10,),
              Text(movies.releaseDate ?? "",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                    color: MyTheme.greyColor),

              ),

         Container(
            child: CachedNetworkImage(
              imageUrl: movies.posterPath ?? '',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator(
                    color: Theme
                        .of(context)
                        .primaryColor,
                  )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
         ),
              SizedBox(height: 10,),
           Text(movies.overview ?? "",
             style: Theme
                 .of(context)
                 .textTheme
                 .titleMedium!
                 .copyWith(
                 color: MyTheme.white
             ),
             textAlign: TextAlign.end ,
           ),
            ],

          ),


        ),
     );

  }
}