import 'package:flutter/material.dart';
import 'package:netflix/ui/widgets/movie_synopsis.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({ Key? key }) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        MovieSynopsis()
      ]),
    );
  }
}