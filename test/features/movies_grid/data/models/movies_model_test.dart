import 'package:flutter_test/flutter_test.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movies_model.dart';

void main() {
  final date = DateTime.now();

  final tMovie = MovieModel(
    'name',
    'plot',
    ['genres'],
    3.3,
    'director',
    'posterUrl',
    234,
    1244,
    date,
    [ActorModel('name', 'characterName', 'imageUrl')],
    ['gallary'],
    33,
  );

  final tMovieJson = {
    'name': 'name',
    'plot': 'plot',
    'genres': ['genres'],
    'rating': 3.3,
    'director': 'director',
    'posterUrl': 'posterUrl',
    'budget': 234,
    'runningTime': 1244,
    'releaseDate': date.toIso8601String(),
    'actors': [ActorModel('name', 'characterName', 'imageUrl').toJson()],
    'gallaryImagesUrl': ['gallary'],
    'revenue': 33,
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
    test(
    'should encode movie object correctly',
    () {
      //act
      final result = tMovie.toJson();
      //assert
      expect(result, equals(tMovieJson));
    },
  );

}
