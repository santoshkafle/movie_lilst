import 'package:flutter/widgets.dart';
import 'package:movie_list/model/movie_api_service.dart';
import 'package:movie_list/model/movie_model.dart';

class FilterMovieProvider with ChangeNotifier {
  List<MovieModel> _allMovieList = [];
  List<MovieModel> _topRatedMovie = [];
  int _movieIdex = 0;
  bool _isTopRated = true;

  List<MovieModel> get getAllMovieList => _allMovieList;
  List<MovieModel> get getTopMovieList => _topRatedMovie;
  int get MovieIdex => _movieIdex;
  bool get isTopRated => _isTopRated;

  Future<bool> initilizeMovie() async {
    _allMovieList = await MovieApiService().getMovieList();
    _topRatedMovie = await MovieApiService().getTopRatedMovie();

    if (_allMovieList.isNotEmpty && _topRatedMovie.isNotEmpty) {
      return true; //this means all movie loaded and ready to use.
    } else {
      return false; //this means movie not loaded and empty.
    }
  }

  MovieModel getMovieDetails(int index) {
    if (_isTopRated) {
      if (index >= 0 && index < _topRatedMovie.length) {
        return _topRatedMovie[index];
      } else {
        _movieIdex = 0;
        return _topRatedMovie[_movieIdex];
      }
    } else {
      if (index >= 0 && index < _allMovieList.length) {
        return _allMovieList[index];
      } else {
        _movieIdex = 0;
        return _allMovieList[_movieIdex];
      }
    }
  }

  void setMovieIdex(int index) {
    _movieIdex = index;
    notifyListeners();
  }

  void setFlagOfMovie(bool isTopRated) {
    _isTopRated = isTopRated;
    notifyListeners();
  }
}
