import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_gallery/features/movies_grid/presentation/pages/movie_details_screen.dart';

import 'features/movies_grid/presentation/cubit/movies_cubit.dart';
import 'features/movies_grid/presentation/pages/movies_page.dart';
import 'injection.dart' as gI_dir;

void main() {
  gI_dir.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => gI_dir.gi<MoviesCubit>(),
      child: MaterialApp(
        title: 'Movies Gallary',
        theme: ThemeData.dark(),
        home: MoviesScreen(),
        routes: {
          MovieDetailScreen.NAME: (_) => MovieDetailScreen(),
        },
      ),
    );
  }
}
