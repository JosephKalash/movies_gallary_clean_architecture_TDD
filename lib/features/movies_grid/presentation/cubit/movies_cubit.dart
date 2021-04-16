import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movie_details.dart';

import '../../domain/entites/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMovies _getMovies;
  final GetMovieDetails _getMovieDetails;

  MoviesCubit(
    this._getMovies,
    this._getMovieDetails,
  ) : super(Initial());

  Future<void> getMoviesList() async {
    emit(Loading());

    final either = await _getMovies();
    either.fold(
      (_) async => emit(Error('message')),
      (movies) async => emit(LoadedWithMovies(movies)),
    );
  }

  Future<void> getMovieWithDetails(int id) async {
    emit(Loading());

    final either = await _getMovieDetails(id);
    either.fold(
      (_) async => emit(Error('error')),
      (movie)async => emit(LoadedWithMovieDetails(movie)),
    );
  }
}
