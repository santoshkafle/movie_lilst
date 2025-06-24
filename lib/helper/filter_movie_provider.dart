import 'package:flutter/widgets.dart';
import 'package:movie_list/model/movie_api_service.dart';
import 'package:movie_list/model/movie_model.dart';

class FilterMovieProvider with ChangeNotifier {
  late Future<List<MovieModel>> _allMovieList;
  late Future<List<MovieModel>> _topRatedMovie;

  Future<List<MovieModel>> initilizeMovie() {
    _allMovieList = MovieApiService().getMovieList();
    return _allMovieList;
  }

  Future<List<MovieModel>> initilizeTopRateMovie() {
    _topRatedMovie = MovieApiService().getTopRatedMovie();
    return _topRatedMovie;
  }

  // Future<List<MovieModel>> get getAllMovie => _allMovieList;

  //Future<List<MovieModel>> get getTopRatedMovie => _topRatedMovie;
}
