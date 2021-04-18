import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entites/movie.dart';
import '../cubit/movies_cubit.dart';

class MovieBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = _getMovieFromProvider(context);

    return Container(
      child: movie == null
          ? Text('unknown error occurred')
          : Column(
              children: [
                _buildStack(movie, context),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OVERVIEW:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text('${movie.overview}'),
              ],
            ),
    );
  }

  Stack _buildStack(Movie movie, BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.gallaryImagesUrl![0],
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.all(10),
          color: Colors.red.withOpacity(0.2),
          child: Column(
            children: [
              Text(_formateGenres(movie.genres)),
              _buildMovieMainInfo(movie),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildMovieMainInfo(Movie movie) {
    return Row(
      children: [
        Hero(
          tag: movie.id,
          child: Image.network(movie.posterUrl!),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${movie.voteAverage}'),
            Text('${movie.director}'),
            Text('${movie.runTime}'),
            Text('${movie.releaseDate.toIso8601String()}'),
          ],
        ),
      ],
    );
  }

  Movie? _getMovieFromProvider(BuildContext context) {
    final cubit = BlocProvider.of<MoviesCubit>(context, listen: false);
    final state = cubit.state;
    if (state is LoadedWithMovieDetails) return state.movie;
    return null;
  }

  String _formateGenres(List<String> genres) {
    if (genres.length == 0) return '';
    print(genres);
    var str = genres[0];
    for (int i = 1; i < genres.length; i++) {
      str = '$str | ${genres[i]}';
    }
    return str;
  }
}
