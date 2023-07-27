abstract class IMoviesServices {
  Future<dynamic> fetchMovies();
  Future<dynamic> fetchMovieByID(int id);
}
