import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/tabs/MoviesTap.dart';
import 'package:movies/tabs/secondScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore.instance.settings =
  //     Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  // await FirebaseFirestore.instance.disableNetwork();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MoviesTap.routeName: (context) => MoviesTap(),
        SecondScreen.routeName: (context) => SecondScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
