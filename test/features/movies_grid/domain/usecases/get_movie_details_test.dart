import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movies_model.dart';
import 'package:movies_gallery/features/movies_grid/domain/entites/movie.dart';
import 'package:movies_gallery/features/movies_grid/domain/repositories/movies_repository.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movie_details.dart';

import 'get_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  final mockRepository = MockMovieRepository();
  final usecase = GetMovieDetails(mockRepository);

  final tNumber = 1;
  final Movie movie = MovieModel.fromJson(
      {
        "id": 1,
        "genre_ids": [28, 878],
        "overview":
            "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
        "poster_path": "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
        "release_date": "2021-03-24",
        "title": "Godzilla vs. Kong",
        "vote_average": 8.4,
      },
    );

  test(
    'should get List<Movie> when getMovies usecae has been called',
    () async {
      //arrange
      when(mockRepository.getMovieDetails(any)).thenAnswer((_) async => Right(movie));
      //act
      final result = await usecase(tNumber);
      //assert
      verify(mockRepository.getMovieDetails(tNumber));
      expect(result, Right(movie));
    },
  );
}
