import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/movie.dart';
import '../cubit/movies_cubit.dart';
import 'movie_cart.dart';

class MoviesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movies = _getMoviesInfo(context);

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 36,
        crossAxisSpacing: 26,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (_, i) => MovieCart(movies[i]),
    );
  }

  List<Movie> _getMoviesInfo(BuildContext context) {
    final cubit = BlocProvider.of<MoviesCubit>(context, listen: false);
    final state = cubit.state;
    if (state is LoadedWithMovies) return state.movies;
    return [];
  }
}
