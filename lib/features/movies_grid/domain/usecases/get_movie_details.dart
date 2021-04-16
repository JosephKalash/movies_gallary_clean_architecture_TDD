import 'package:dartz/dartz.dart';
import '../repositories/movies_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entites/movie.dart';

class GetMovieDetails extends Usecase {
  final MovieRepository _movieRepository;

  GetMovieDetails(this._movieRepository);

  Future<Either<Failure, Movie>> call(int id) {
    return _movieRepository.getMovieDetails(id);
  }
}
