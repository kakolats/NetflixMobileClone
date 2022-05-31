// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:netflix/services/api.dart';

class Acteur {
  final String name;
  final String originalName;
  final String? profilePath;

  Acteur({
    required this.name,
    required this.originalName,
    this.profilePath,
  });

  

  Acteur copyWith({
    String? name,
    String? originalName,
    String? profilePath,
  }) {
    return Acteur(
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'originalName': originalName,
      'profilePath': profilePath,
    };
  }

  factory Acteur.fromJson(Map<String, dynamic> map) {
    return Acteur(
      name: map['character'] as String,
      originalName: map['original_name'] as String,
      profilePath: map['profile_path'],
    );
  }

  String profileUrl(){
    Api api = Api();
    //print(api.baseImageUrl+posterPath!);
    return api.baseImageUrl+profilePath!;
  }
}
