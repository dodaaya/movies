import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/model/PopularMoviesResponse.dart';

class FireBaseUtils {
  static CollectionReference<Result> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection('movies')
        .withConverter<Result>(
        fromFirestore: (snapchot, option) =>
            Result.fromJson(snapchot.data()!),
        toFirestore: (result, option) => result.toJson());
  }

  static Future<void> addMovie(Result movie) {
    DocumentReference <Result> doc = getMoviesCollection().doc();
    movie.fbId = doc.id;
    return doc.set(movie);
  }

  static Future<List<Result>?> getAllMoviesFromFireStore() async {
    QuerySnapshot <Result> querySnapshot = await getMoviesCollection().get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }
  static Future <void> deletTaskFromFireStore(String id){
    return getMoviesCollection().doc(id).delete();
  }
}
