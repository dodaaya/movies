import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/Data%20classes/movie.dart';

import '../Data classes/my_users.dart';

class FirebaseUtils {
  /////////////////////// task data
  static CollectionReference<Movie> getMoviesCollection() {
    return FirebaseFirestore.instance.collection('movie').withConverter<Movie>(
        fromFirestore: (snapshot, options) =>
            Movie.fromFireStore(snapshot.data()!),
        toFirestore: (movies, options) => movies.toFireStore());
  }

  static Future<void> addTaskToFireStore(Movie movie) {
    var movieCollection = getMoviesCollection();
    DocumentReference<Movie> docRef = movieCollection.doc();

    /// generate auto-id
    movie.id = docRef.id;
    return docRef.set(movie);
  }

  static Future<void> deleteTaskFromFireStore(Movie movies, String uId) {
    return getMoviesCollection().doc(movies.id).delete();
  }

  ///////////////////////      user data
  //
  static CollectionReference<MyUsers> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUsers.collection)
        .withConverter<MyUsers>(
            fromFirestore: (snapshot, options) =>
                MyUsers.fromFireStore(snapshot.data()!),
            toFirestore: (MyUsers, options) => MyUsers.toFireStore());
  }
//
// static Future<void> addUserToFireStore(MyUsers user) {
//   var userCollection = getUsersCollection();
//   DocumentReference<MyUsers> docRef = userCollection.doc(user.id);
//   return docRef.set(user);
// }
//
// static Future<MyUsers?> readUserFromFireStore(String uId) async {
//   var querySnapShot = await getUsersCollection().doc(uId).get();
//   return querySnapShot.data();
// }
}
