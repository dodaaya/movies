import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return FutureBuilder<PopularMoviesResponse?>(
          future: ApiManager.getPopMov(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
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
            var results = snapshot.data?.results ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return Text(
                  results[index].originalTitle ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              },
              itemCount: results.length,
            );
          },
        );
      }).toList(),
    );
    //     SizedBox(
    //       height: 18,
    //     ),
    //     Container(
    //       height: MediaQuery.of(context).size.height * 0.22,
    //       color: MyTheme.greyColor,
    //     ),
    //     SizedBox(
    //       height: 18,
    //     ),
    //     Container(
    //       height: MediaQuery.of(context).size.height * 0.22,
    //       color: MyTheme.greyColor,
    //     )
    //   ]),
    // ),
  }
}
