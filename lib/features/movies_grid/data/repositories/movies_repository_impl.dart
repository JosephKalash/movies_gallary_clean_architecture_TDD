import 'package:dartz/dartz.dart';
import 'package:movies_gallery/core/error/excpetions.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/internet_info.dart';
import '../../domain/entites/movie.dart';
import '../../domain/repositories/movies_repository.dart';
import '../data_source/movies_remote_DS.dart';

class MoviesRepositoryImpl extends MovieRepository {
  final RemoteDS remoteDS;
  final InternetInfo internetInfo;

  MoviesRepositoryImpl(this.remoteDS, this.internetInfo);

  @override
  Future<Either<Failure, List<Movie>>> getPopularityMovies() async {
    if (await internetInfo.isConnect) {
      try {
        final movies = await remoteDS.fetchPopularityMovies();
        return Right(movies);
      } on ServerExcpetion {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieDetails(int id) async{
    if (await internetInfo.isConnect) {
      try {
        final movie = await remoteDS.fetchMovieDetails(id);
        return Right(movie);
      } on ServerExcpetion {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
