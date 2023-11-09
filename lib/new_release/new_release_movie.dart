import 'package:flutter/material.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/new_release/movie_row.dart';

import '../model/NewReleaseResponse.dart';

class NewRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewReleaseResponse?>(
        future: ApiManager.getNewReleaseMov(),
        builder: (context, snapshot) {
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
          if (snapshot.data?.status_message != null) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('try again'))
              ],
            );
          }
          var result2List = snapshot.data?.results ?? [];
          return MovieRow(
            results2: result2List,
          );
        });
  }
}
