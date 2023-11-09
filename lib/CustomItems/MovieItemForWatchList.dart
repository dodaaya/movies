import 'package:flutter/material.dart';

class MovieItemForWatchList extends StatelessWidget {

 String? posterPath;
 String? title;
 String? date;
 String? vote;
 MovieItemForWatchList({required this.posterPath,required this.date,required this.title, required this.vote});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.02, bottom: 10),
      child: Row(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.2,
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: ClipRRect(
                child: Image.network(("https://image.tmdb.org/t/p/w500"+posterPath!),
                  width: double.infinity, fit: BoxFit.fill, height: double.infinity,)),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title??"",
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
                date??"",
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
                vote??"",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
