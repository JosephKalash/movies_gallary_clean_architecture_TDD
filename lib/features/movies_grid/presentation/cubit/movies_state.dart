part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class Initial extends MoviesState {}

class Loading extends MoviesState {}

class LoadedWithMovies extends MoviesState {
  final List<Movie> _movies;

  LoadedWithMovies(this._movies);

  List<Movie> get movies => [..._movies];

  @override
  List<Object> get props => [_movies];
}

class LoadedWithMovieDetails extends MoviesState {
  final Movie _movie;

  LoadedWithMovieDetails(this._movie);

  Movie get movie => _movie;

  @override
  List<Object> get props => [_movie];
}

class Error extends MoviesState {
  final message;

  Error(this.message);
  
  @override
  List<Object> get props => [message];
}
