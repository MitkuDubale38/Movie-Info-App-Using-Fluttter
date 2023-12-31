import 'dart:convert';

import 'package:get/get.dart';
import 'package:moviedbapp/app/models/movies/movie.dart';
import 'package:moviedbapp/app/models/movies/movies.dart';
import 'package:moviedbapp/app/services/movies/movies_serivce_impl.dart';
import 'package:http/http.dart' as http;

class moviesController extends GetxController with StateMixin<AllMovie> {
  RxStatus loadingStatus = RxStatus.loading();
  AllMovie? movies;
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
        movies = AllMovie.fromJson(jsonDecode(response.body));
      }
      change(movies, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error("Error"));
    }
  }
}
