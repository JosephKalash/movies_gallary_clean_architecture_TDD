import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entites/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularityMovies();
  Future<Either<Failure, Movie>> getMovieDetails(int id);
}
