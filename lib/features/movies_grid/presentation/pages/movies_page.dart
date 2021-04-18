import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movies_cubit.dart';
import '../widgets/movies_grid.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  var _initWidget = true;

  @override
  void didChangeDependencies() {
    if (_initWidget) {
      _fetchMoviesData();
      _initWidget = false;
    }
    super.didChangeDependencies();
  }

  void _fetchMoviesData() {
    final cubit = BlocProvider.of<MoviesCubit>(context);
    cubit.getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies Gallary'),
        ),
        body: _buildBlocBuilder(),
      ),
    );
  }

  BlocBuilder<MoviesCubit, MoviesState> _buildBlocBuilder() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (_, state) {
        if (state is LoadedWithMovies)
          return MoviesGrid();
        else if (state is Loading)
          return _buildProgressIndicator();
        else if (state is Error)
          return _buildText(state.message);
        else {
          return _buildText('Try Later...');
        }
      },
    );
  }

  Center _buildProgressIndicator() =>
      Center(child: CircularProgressIndicator());

  Center _buildText(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
