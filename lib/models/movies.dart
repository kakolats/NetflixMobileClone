// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:netflix/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final double popularity;
  final String releaseDate;
  final String? posterPath;
  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.popularity,
    required this.releaseDate,
    this.posterPath,
  });
  

  

  

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      name: map['title'] as String,
      description: map['overview'] as String,
      popularity: map['vote_average']*10.0 as double,
      releaseDate: map['release_date'] as String,
      posterPath: map['poster_path']
    );
  }

  String posterUrl(){
    Api api = Api();
    //print(api.baseImageUrl+posterPath!);
    return api.baseImageUrl+posterPath!;
  }

}
