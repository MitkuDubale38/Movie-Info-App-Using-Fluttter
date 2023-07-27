import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviedbapp/app/models/movies/movie.dart';
import 'package:moviedbapp/app/models/movies/movies.dart';
import 'package:moviedbapp/app/services/movies/movies_serivce_impl.dart';
import 'package:http/http.dart' as http;

class movieController extends GetxController with StateMixin<Movie> {
  RxStatus loadingStatus = RxStatus.loading();
  Movie? movie;

  void loadMoviesById(int id) async {
    try {
      change(null, status: RxStatus.loading());
      dynamic response = await MoviesServices().fetchMovieByID(id);
      if (response.runtimeType == http.Response) {
        movie = Movie.fromJson(jsonDecode(response.body));
      }
      change(movie, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Error"));
    }
  }
}
