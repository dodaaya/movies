import 'package:flutter/material.dart';
import 'package:movies/CustomItems/MovieItem.dart';
import 'package:movies/Models/GenreResponse.dart';
import 'package:movies/Models/MoviesResponse.dart';
import 'package:movies/api/api_manager.dart';

class MoviesTap extends StatelessWidget {
  static const String routeName = "movies";

  @override
  Widget build(BuildContext context) {
    var genre = ModalRoute.of(context)?.settings.arguments as Genres;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121312),
        appBar: AppBar(
          backgroundColor: Color(0xff121312),
          title: Text(
            genre?.name ?? "",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<MoviesResponse?>(
            future: ApiManager.getMoviesResponse(genre.id.toString()),
            builder: (context, snapchot) {
              if (snapchot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else if (snapchot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text("error occured",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.sizeOf(context).width * 0.25),
                        child: ElevatedButton(
                          onPressed: () {
                            ApiManager.getMoviesResponse(genre.id.toString());
                          },
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Try again",
                                style: TextStyle(fontSize: 17),
                              ),
                              Icon(Icons.refresh)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (snapchot.data?.status_message != null ||
                  snapchot.data?.success == false) {
                return Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        snapchot.data?.status_message ?? "",
                        style:
                        TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                            MediaQuery.sizeOf(context).width * 0.25),
                        child: ElevatedButton(
                          onPressed: () {
                            ApiManager.getMoviesResponse(genre.id.toString());

                          },
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Try again",
                                style: TextStyle(fontSize: 17),
                              ),
                              Icon(Icons.refresh)
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              List <Result> moviesList= snapchot.data?.results??[];
              return ListView.separated(itemBuilder:(context,index){
                return MovieItem(movie: moviesList![index],);
              }, itemCount: moviesList.length,separatorBuilder:(context,index){return Container(
                height: 10,
                color: Colors.black87,
              );},);
            }),
      ),
    );
  }
}
