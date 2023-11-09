import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/CustomItems/CategoryItem.dart';
import 'package:movies/Models/GenreResponse.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/tabs/MoviesTap.dart';

class CategoriesTap extends StatelessWidget {
  List<String> imagePath = [
    "assets/images/actionn.jpg",
    "assets/images/adventure.jpg",
    "assets/images/cartoon.jpg",
    "assets/images/comedy.jpg",
    "assets/images/crime.jpg",
    "assets/images/documentry.jpg",
    "assets/images/drama.jpg",
    "assets/images/family.jpg",
    "assets/images/actionn.jpg",
    "assets/images/history.jpg",
    "assets/images/horror.jpg",
    "assets/images/music.jpg",
    "assets/images/actionn.jpg",
    "assets/images/romance.jpg",
    "assets/images/science_fiction.jpg",
    "assets/images/actionn.jpg",
    "assets/images/actionn.jpg",
    "assets/images/actionn.jpg",
    "assets/images/actionn.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: 10.0,
            top: MediaQuery.sizeOf(context).height * 0.1,
            right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Browse Category",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            FutureBuilder<GenreResponse?>(
                future: ApiManager.getGenresResponse(),
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
                    return Column(
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
                              ApiManager.getGenresResponse();
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
                    );
                  } else if (snapchot.data?.status_message != null ||
                      snapchot.data?.success == false) {
                    return Column(
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
                              ApiManager.getGenresResponse();
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
                    );
                  }

                  List<Genres>? categories = snapchot.data?.genres;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing:
                          MediaQuery.sizeOf(context).height * 0.05,
                          crossAxisCount: 2,
                          crossAxisSpacing:
                          MediaQuery.sizeOf(context).width * 0.1),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap:(){
                            Navigator.pushNamed(context, MoviesTap.routeName, arguments:categories?[index]);
                          } ,
                          child: CategoryItem(
                            name: categories?[index]?.name ?? "",
                            imagePath: imagePath[index],
                          ),
                        );
                      },
                      itemCount: categories?.length ?? 0,
                    ),
                  );
                }),
          ],
        ),),
    );
  }
}
