import 'dart:convert';
import 'package:movie_list/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  final movieApiLinks = "https://api.tvmaze.com/shows";

  Future<List<MovieModel>> getMovieList() async {
    final respone = await http.get(Uri.parse(movieApiLinks));
    List<dynamic> data = json.decode(respone.body);

    if (respone.statusCode == 200) {
      return data.map((e) => MovieModel.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<MovieModel>> getTopRatedMovie() async {
    final respone = await http.get(Uri.parse(movieApiLinks));
    List<dynamic> data = json.decode(respone.body);

    if (respone.statusCode == 200) {
      var movieDate = data.map((e) => MovieModel.fromMap(e)).toList();
      return movieDate.where((e) => (e.rating?.average ?? 0) > 8.5).toList();
    } else {
      return [];
    }
  }
}
