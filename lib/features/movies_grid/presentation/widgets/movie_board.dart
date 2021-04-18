import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:movies_gallery/core/utls/func.dart';
import '../../domain/entites/movie.dart';
import '../cubit/movies_cubit.dart';

class MovieBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = _getMovieFromProvider(context);

    return movie == null
        ? Text('unknown error occurred')
        : SingleChildScrollView(
            child: Column(
              children: [
                _buildStack(movie, context),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OVERVIEW:',
                        style: _buildTextStyleInfoTitle(),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${movie.overview}',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildStack(Movie movie, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Image.network(
              movie.gallaryImagesUrl![0],
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(18),
              margin: EdgeInsets.all(18),
              color: Colors.red.shade900.withOpacity(0.6),
              child: Column(
                children: [
                  Text(
                    formateGenres(movie.genres),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  _buildMovieMainInfo(movie),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Budget:',
                        style: _buildTextStyleInfoTitle(),
                      ),
                      Text(
                        '${MoneyFormatter(amount: movie.budget!.toDouble()).output.compactSymbolOnLeft}',
                        style: _buildTextStyleInfo(),
                      ),
                      SizedBox(width: 14),
                      Text(
                        'revenue:',
                        style: _buildTextStyleInfoTitle(),
                      ),
                      Text(
                        '${MoneyFormatter(amount: movie.revenue!.toDouble()).output.compactSymbolOnLeft}',
                        style: _buildTextStyleInfo(),
                      ),
                      SizedBox(width: 14),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildMovieMainInfo(Movie movie) {
    return Row(
      children: [
        Container(
          height: 280,
          width: 150,
          child: Image.network(movie.posterUrl!),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate:',
              style: _buildTextStyleInfoTitle(),
            ),
            Text(
              '${movie.voteAverage}',
              style: _buildTextStyleInfo(),
            ),
            SizedBox(height: 14),
            Text(
              'Directore:',
              style: _buildTextStyleInfoTitle(),
            ),
            Text(
              '${movie.director}',
              style: _buildTextStyleInfo(),
            ),
            SizedBox(height: 14),
            Text(
              'Run time:',
              style: _buildTextStyleInfoTitle(),
            ),
            Text(
              '${movie.runTime}',
              style: _buildTextStyleInfo(),
            ),
            SizedBox(height: 14),
            Text(
              'Released Date:',
              style: _buildTextStyleInfoTitle(),
            ),
            Text(
              '${DateFormat('DD/MM/yyyy').format(movie.releaseDate)}',
              style: _buildTextStyleInfo(),
            ),
          ],
        ),
      ],
    );
  }

  TextStyle _buildTextStyleInfo() {
    return TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
  }

  TextStyle _buildTextStyleInfoTitle() {
    return TextStyle(
      color: Colors.greenAccent.shade700,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  Movie? _getMovieFromProvider(BuildContext context) {
    final cubit = BlocProvider.of<MoviesCubit>(context, listen: false);
    final state = cubit.state;
    if (state is LoadedWithMovieDetails) return state.movie;
    return null;
  }

  
}
