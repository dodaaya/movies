import 'package:flutter/material.dart';
import 'package:movies/Firebase/firebase_utils.dart';
import 'package:movies/ListProvider.dart';
import 'package:movies/myTheme.dart';
import 'package:provider/provider.dart';

class MovieItemForWatchList extends StatelessWidget {
  String? posterPath;
  String? title;
  String? date;
  String? vote;
  String? movieId;

  MovieItemForWatchList(
      {required this.posterPath,
      required this.date,
      required this.title,
      required this.vote,
      required this.movieId});
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ListProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02, bottom: 10),
      child: Row(
        children: [
          Stack(alignment: Alignment.bottomRight, children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.2,
              width: MediaQuery.sizeOf(context).width * 0.4,
              child: ClipRRect(
                  child: Image.network(
                ("https://image.tmdb.org/t/p/w500" + posterPath!),
                width: double.infinity,
                fit: BoxFit.fill,
                height: double.infinity,
              )),
            ),
            IconButton(
                onPressed: () {
                  FireBaseUtils.deletTaskFromFireStore(movieId ?? "").then((value) => prov.geTaskasync());
                  
                },
                icon: Icon(
                  Icons.bookmark_remove,
                  color: MyTheme.selectedYellowColor,
                  size: 40,
                ))
          ]),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.05,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  date ?? "",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  vote ?? "",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
