import 'package:flutter_test/flutter_test.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movie_model.dart';

void main() {
  final date = DateTime.now();

  final tMovie = MovieModel(
    1,
    'name',
    'overview',
    23.3,
    'https://image.tmdb.org/t/p/w200/posterUrl',
    date,
    ['Action', 'Crime'],
  );
final tMovieDetails = MovieModel(
    1,
    'name',
    'overview',
    23.3,
    'https://image.tmdb.org/t/p/w200/posterUrl',
    date,
    ['Action'],
    runTime: 1,
    actors: [ActorModel('name', 'characterName', 'https://image.tmdb.org/t/p/w200/imageUrl')],
    budget: 1,
    revenue: 1,
    director: 'joseph',
    gallaryImagesUrl: ['https://image.tmdb.org/t/p/w200/image'],
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
  final tMovieDetailsJson = {
    'id': 1,
    'title': 'name',
    'overview': 'overview',
    "genres": [{'name':'Action'}],
    'vote_average': 23.3,
    'poster_path': 'posterUrl',
    'release_date': date.toIso8601String(),
    'runtime': 1,
    'budget': 1,
    'revenue': 1,
    'credits': {
      'cast': [
        {
          'name': 'name',
          'character': 'characterName',
          'profile_path': 'imageUrl'
        }
      ],
      'crew':[
        {
          'job':'Director',
          'name': 'joseph'
        }
      ]
    },
    'images': {
      'backdrops': [
        {'file_path': 'image'}
      ]
    },
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
    'should construct movie object with details from json correctly',
    () {
      //act
      final result = MovieModel.fromJsonWithDetails(tMovieDetailsJson);
      //assert
      expect(result, equals(tMovieDetails));
    },
  );
}
