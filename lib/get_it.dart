import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movie_details.dart';

import 'core/network/internet_info.dart';
import 'features/movies_grid/data/data_source/movies_remote_DS.dart';
import 'features/movies_grid/data/repositories/movies_repository_impl.dart';
import 'features/movies_grid/domain/repositories/movies_repository.dart';
import 'features/movies_grid/domain/usecases/get_movies_usecase.dart';
import 'features/movies_grid/presentation/cubit/movies_cubit.dart';

final gi = GetIt.instance;

void init() {
  gi.registerFactory(() => MoviesCubit(
        gi(),
        gi(),
      ));

  gi.registerLazySingleton(
    () => GetMovies(gi()),
  );
  gi.registerLazySingleton(
    () => GetMovieDetails(gi()),
  );

  gi.registerLazySingleton<MovieRepository>(
    () => MoviesRepositoryImpl(
      gi(),
      gi(),
    ),
  );

  gi.registerLazySingleton<RemoteDS>(
    () => RemoteDSImpl(gi()),
  );
  gi.registerLazySingleton(() => Dio());

  gi.registerLazySingleton<InternetInfo>(
    () => InternetInfoImpl(gi()),
  );
  gi.registerLazySingleton(() => InternetConnectionChecker());
}
