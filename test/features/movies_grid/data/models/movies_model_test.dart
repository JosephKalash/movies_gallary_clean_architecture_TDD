import 'package:flutter_test/flutter_test.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movies_model.dart';

void main() {
  final date = DateTime.now();

  final tMovie = MovieModel(
    1,
    'name',
    'overview',
    23.3,
    'https://image.tmdb.org/t/p/w200/posterUrl',
    date,
    ['Action','Crime']
  );

  final tMovieJson = {
    'id': 1,
    'title': 'name',
    'overview': 'overview',
    "genre_ids": [28, 80],
    'vote_average': 23.3,
    'poster_path': 'posterUrl',
    'release_date': date.toIso8601String(),
  };
  test(
    'should construct movie object from json correctly',
    () {
      //act
      final result = MovieModel.fromJson(tMovieJson);
      //assert
      expect(result, equals(tMovie));
    },
  );
}
