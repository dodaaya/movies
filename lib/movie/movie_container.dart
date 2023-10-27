import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/PopularMoviesResponse.dart';
import 'package:movies/tabs/watchlist_tab.dart';

import '../myTheme.dart';

class MovieCont extends StatelessWidget {
  List<Result> resultsList;

  MovieCont({required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(height: 400.0),
        itemCount: resultsList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      resultsList[itemIndex].backdropPath!,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle,
                      color: MyTheme.white,
                      size: 80,
                    )),
                InkWell(
                  onTap: () {
                    print('hello');
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.42,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Stack(
                          children: [
                            Image.network(
                              'https://image.tmdb.org/t/p/w500' +
                                  resultsList[itemIndex].posterPath!,
                            ),
                            Icon(
                              Icons.bookmark,
                              color: MyTheme.transparentColor,
                              size: 39,
                            ),
                            Container(
                              width: 39,
                              height: 35,
                              child: Icon(
                                Icons.add,
                                color: MyTheme.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 165),
                        child: Text(
                          resultsList[itemIndex].title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 165),
                        child: Text(
                          resultsList[itemIndex].releaseDate ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.lighterGreyColor),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}
