import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entites/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMovies _getMovies;

  MoviesCubit(this._getMovies) : super(Initial());

  Future<void> getMoviesList() async {
    emit(Loading());

    final either = await _getMovies();
     either.fold(
      (_)async => emit(Error('message')),
      (movies)async => emit(Loaded(movies)),
    );
  }
}
