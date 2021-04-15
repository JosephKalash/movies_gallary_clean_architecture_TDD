import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entites/movie.dart';
import '../repositories/movies_repository.dart';

class GetMovies extends Usecase {
  final MovieRepository movieRepository;

  GetMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getPopularityMovies();
  }
}


