import 'package:flutter/material.dart';

import '../myTheme.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.black,
      child: Column(children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/background_dora.png',
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle,
                  color: MyTheme.white,
                  size: 80,
                )),
            Container(
                alignment: Alignment.bottomLeft,
                height: MediaQuery.of(context).size.height * 0.40,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Dora_movie.png',
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
                )),
            Container(
              alignment: Alignment.bottomRight,
              width: MediaQuery.of(context).size.width * 0.86,
              height: MediaQuery.of(context).size.height * 0.39,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dora and the lost city of gold',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.white),
                  ),
                  Text(
                    '2019  PG-13  2h 7m',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.lighterGreyColor),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          color: MyTheme.greyColor,
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.22,
          color: MyTheme.greyColor,
        )
      ]),
    );
  }
}
