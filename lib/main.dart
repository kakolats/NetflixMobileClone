import 'package:flutter/material.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/ui/screens/home_screen.dart';
import 'package:netflix/ui/screens/loading_screen.dart';
import 'package:netflix/ui/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context)=>DataRepository()),
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
      ),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
} 
