import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movies_usecase.dart';

import '../../domain/entites/movie.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMovies getMovies;

  MoviesCubit(this.getMovies) : super(Initial());

  Future<void> getMoviesList() async {
    emit(Loading());

    final either = await getMovies();
     either.fold(
      (_)async => emit(Error('message')),
      (movies)async => emit(Loaded(movies)),
    );
  }
}
