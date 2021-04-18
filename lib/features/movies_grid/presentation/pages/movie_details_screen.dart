import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movies_cubit.dart';
import '../widgets/movie_board.dart';

class MovieDetailScreen extends StatefulWidget {
  static const NAME = '/movieDetails';

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  var _initWidget = true;
  var _movieName;

  @override
  void didChangeDependencies() {
    if (_initWidget) {
      _fetchData();
      _initWidget = false;
    }
    super.didChangeDependencies();
  }

  void _fetchData() {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    _movieName = arguments['name'];

    final cubit = BlocProvider.of<MoviesCubit>(context, listen: false);
    cubit.getMovieWithDetails(arguments['id']);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        final cubit = BlocProvider.of<MoviesCubit>(context, listen: false);
        cubit.getMoviesList();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('$_movieName'),
        ),
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (_, state) {
            if (state is LoadedWithMovieDetails)
              return MovieBoard();
            else if (state is Loading)
              return _buildProgressIndicator();
            else if (state is Error)
              return _buildText(state.message);
            else
              return _buildText('Try later');
          },
        ),
      ),
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
