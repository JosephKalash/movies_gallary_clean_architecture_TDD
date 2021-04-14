import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/movies_grid/presentation/cubit/movies_cubit.dart';
import 'features/movies_grid/presentation/pages/movies_page.dart';
import 'get_it.dart' as dir_GI;

void main() {
  dir_GI.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Gallary',
      theme: ThemeData.dark(
          
          ),
      home: BlocProvider(
        create: (_) => dir_GI.gi<MoviesCubit>(),
        child: MoviesScreen(),
      ),
    );
  }
}
