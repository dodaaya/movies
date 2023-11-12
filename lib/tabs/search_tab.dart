import 'package:flutter/material.dart';

import '../myTheme.dart';
import '../search/search_movie_delegate.dart';

class Search_Tab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                    color: MyTheme.greyColor),
                child: TextField(
                    style: TextStyle(color: MyTheme.white),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      hintText: "Search",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: MyTheme.greyBorderColor, fontSize: 20),
                      prefixIcon: InkWell(
                        onTap: () => showSearch(
                            context: context, delegate: SearchMovieDelegate()),
                        child: Icon(
                          Icons.search,
                          color: MyTheme.white,
                          size: 20,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: MyTheme.black,
        child: Center(child: Image.asset('assets/images/movie.png')),
      ),
    );
  }
}
