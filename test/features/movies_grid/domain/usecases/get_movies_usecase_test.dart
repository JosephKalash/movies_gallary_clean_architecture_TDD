import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/features/movies_grid/domain/entites/movie.dart';
import 'package:movies_gallery/features/movies_grid/domain/repositories/movies_repository.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movies_usecase.dart';
import './get_movies_usecase_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  final mockRepository = MockMovieRepository();
  final usecase = GetMovies(mockRepository);

  final List<Movie> movies = [];

  test(
    'should get List<Movie> when getMovies usecae has been called',
    () async {
      //arrange
      when(mockRepository.getMovies()).thenAnswer((_) async => Right(movies));
      //act
      final result = await usecase();
      //assert
      verify(mockRepository.getMovies());
      expect(result, Right(movies));
    },
  );
}
