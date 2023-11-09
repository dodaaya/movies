import 'package:flutter/material.dart';

import '../model/PopularMoviesResponse.dart';

class MovieItem extends StatelessWidget {
  Result movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Container(
           height: MediaQuery.sizeOf(context).height*0.45,
            child: ClipRRect(
              //"https://image.tmdb.org/t/p/w500"+widget.movie.posterPath!
                borderRadius: BorderRadius.circular(20),
                child: Image.network(("https://image.tmdb.org/t/p/w500"+movie.posterPath!),
                    width: double.infinity, fit: BoxFit.fill, height: double.infinity,)),
          ),
          SizedBox(height: 20,),
          Text(

            movie.title??"",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,), textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text(" Rate : ${movie.voteAverage.toString()}",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),SizedBox(width: 10,),
              Icon(Icons.star_rate,color: Colors.white,)
            ],
          ),
          SizedBox(height: 10,),
          Text(movie.overview??"",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 17),
          ),
          SizedBox(height: 10,),
          Text(
            movie.releaseDate??"",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 20),textAlign: TextAlign.end,
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
