part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class Initial extends MoviesState {}

class Loading extends MoviesState {}

class Loaded extends MoviesState {
  final List<Movie> _movies;

  Loaded(this._movies);

  List<Movie> get movies => [..._movies];

  @override
  List<Object> get props => [_movies];
}

class Error extends MoviesState {
  final message;

  Error(this.message);
  
  @override
  List<Object> get props => [message];
}
