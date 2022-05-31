import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netflix/models/acteur.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/services/api_service.dart';
import 'package:provider/provider.dart';

class DataRepository with ChangeNotifier{
  final ApiService apiService = new ApiService();
  final List<Movie> _popularMovieList = []; 
  final List<Movie> _playingMovieList = []; 
  final List<Movie> _upcomingMovieList = [];

  final List<Acteur> _castList = [];

  int _popularMovieIndex = 1;
  int _playingMovieIndex = 1;
  int _upcomingMovieIndex = 1;
  int _castIndex = 1;

  List<Movie> get popularMovieList => _popularMovieList;
  List<Movie> get playingMovieList => _playingMovieList;
  List<Movie> get upcomingMovieList => _upcomingMovieList;
  List<Acteur> get castList => _castList;

  Future<void> getPopularMovies() async{
    try{
      List<Movie> movies = await apiService.getPopularMovies(pageNumber: _popularMovieIndex);
      _popularMovieList.addAll(movies);
      _popularMovieIndex++;
        notifyListeners();
    }on Response catch(response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getPlayingMovies() async{
    try{
      List<Movie> movies = await apiService.getPlayingMovies(pageNumber: _playingMovieIndex);
      _playingMovieList.addAll(movies);
      _playingMovieIndex++;
        notifyListeners();
    }on Response catch(response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> getUpcomingMovies() async{
    try{
      List<Movie> movies = await apiService.getUpcomingMovies(pageNumber: _upcomingMovieIndex);
      _upcomingMovieList.addAll(movies);
      _upcomingMovieIndex++;
        notifyListeners();
    }on Response catch(response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initData() async{
    await getPopularMovies();
    await getPlayingMovies();
    await getUpcomingMovies();
  }

  Future<void> getCastActeurs(Movie movie) async{
    try{
      List<Acteur> acteurs = await apiService.getCast(movieId: movie.id);
      _castList.addAll(acteurs);
      _castIndex++;
        notifyListeners();
    }on Response catch(response){
      print("Erreur ${response.statusCode}");
      rethrow;
    }
  }

  Future<void> initDetails(Movie movie)async{
    await getCastActeurs(movie);
  }
}