import 'package:dartz/dartz.dart';
import 'package:movies_gallery/core/error/failures.dart';
import 'package:movies_gallery/core/usecase/usecase.dart';
import 'package:movies_gallery/features/movies_grid/domain/entites/movie.dart';
import 'package:movies_gallery/features/movies_grid/domain/repositories/movie_repository.dart';

class GetMovies extends Usecase {
  final MovieRepository movieRepository;

  GetMovies(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getMovies();
  }
}


