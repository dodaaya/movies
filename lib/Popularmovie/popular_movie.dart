import 'package:flutter/material.dart';
import 'package:movies/Popularmovie/Movie_item.dart';
import 'package:movies/tabs/secondScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../api/api_manager.dart';
import '../model/PopularMoviesResponse.dart';


class PopularMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularMoviesResponse?>(
      future: ApiManager.getPopMov(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            heightFactor: 10,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                '\n${snapshot.error}',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              ElevatedButton(onPressed: () {}, child: Text('try again'))
            ],
          );
        }
        if (snapshot.data?.success == false) {
          return Column(
            children: [
              Text(snapshot.data?.status_message ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('try again'))
            ],
          );
        }
        var resultsList = snapshot.data?.results ?? [];
        return CarouselSlider.builder(
          options: CarouselOptions(height: 238.0,
          autoPlay: true,
              autoPlayInterval: Duration(seconds: 2)),



          itemCount: resultsList.length,

          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SecondScreen.routeName,
                        arguments: resultsList?[itemIndex].id);
                  },
                  child: MovieItem(results: resultsList[itemIndex])));

      },
    );
  }
}
