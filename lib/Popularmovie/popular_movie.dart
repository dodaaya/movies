import 'package:flutter/material.dart';

import '../api/api_manager.dart';
import '../model/PopularMoviesResponse.dart';
import 'movie_container.dart';

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
        return MovieCont(resultsList: resultsList);
      },
    );
  }
}
