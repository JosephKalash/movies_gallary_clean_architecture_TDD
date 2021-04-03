import '../models/movies_model.dart';

abstract class RemoteDS {
  Future<List<MovieModel>> fetchMovies();
}
