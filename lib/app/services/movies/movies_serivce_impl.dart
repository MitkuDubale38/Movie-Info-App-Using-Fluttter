import 'package:http/http.dart' as http;
import 'package:moviedbapp/app/services/movies/Imovies_service.dart';
import 'package:moviedbapp/utils/custom_exceptions.dart';
import 'package:moviedbapp/utils/exeption_handler.dart';
import 'package:moviedbapp/utils/process_http_response.dart';

class MoviesServices implements IMoviesServices {
  @override
  Future<dynamic> fetchMovies() async {
    try {
      final response = await http
          .get(Uri.parse('https://yts.mx/api/v2/list_movies.json'))
          .timeout(
        const Duration(seconds: 100),
        onTimeout: () {
          throw ConnectionTimedOutException();
        },
      );
      return processHttpResponse(response);
    } on Exception catch (ex) {
      return ExceptionHandler().getExceptionString(ex);
    }
  }

  @override
  Future fetchMovieByID(int id) async {
    try {
      final response = await http
          .get(Uri.parse(
              'https://yts.mx/api/v2/movie_details.json?movie_id=$id'))
          .timeout(
        const Duration(seconds: 100),
        onTimeout: () {
          throw ConnectionTimedOutException();
        },
      );
      return processHttpResponse(response);
    } on Exception catch (ex) {
      return ExceptionHandler().getExceptionString(ex);
    }
  }
}
