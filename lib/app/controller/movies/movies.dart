import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviedbapp/app/models/movies.dart';
import 'package:moviedbapp/app/services/movies/movies_serivce.dart';
import 'package:http/http.dart' as http;

class moviesController extends GetxController with StateMixin<Movie> {
  RxStatus loadingStatus = RxStatus.loading();
  Movie? movie;

  @override
  void onInit() {
    loadMovies();
    super.onInit();
  }

  void loadMovies() async {
    try {
      change(null, status: RxStatus.loading());
      dynamic response = await MoviesServices().fetchMovies();
      if (response.runtimeType == http.Response) {
        movie = Movie.fromJson(jsonDecode(response.body));
      }
      change(movie, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Error"));
    }
  }
}
