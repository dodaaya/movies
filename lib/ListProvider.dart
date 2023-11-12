import 'package:flutter/material.dart';
import 'package:movies/Firebase/firebase_utils.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

class ListProvider extends ChangeNotifier{
  List<Result>? movies;
  geTaskasync()async{

    var res= await FireBaseUtils.getAllMoviesFromFireStore();
    movies= res;
    notifyListeners();
  }
}