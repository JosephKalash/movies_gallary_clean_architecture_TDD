import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/core/error/failures.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movie_model.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movie_details.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movies_usecase.dart';
import 'package:movies_gallery/features/movies_grid/presentation/cubit/movies_cubit.dart';
import './movies_cubit_test.mocks.dart';

@GenerateMocks([GetMovies, GetMovieDetails])
void main() {
  final mockGetMovies = MockGetMovies();
  final mockGetMovieDetails = MockGetMovieDetails();
  final cubit = MoviesCubit(
    mockGetMovies,
    mockGetMovieDetails,
  );

  group(
    'getMoviesList',
    () {
      test(
        'should emits MoviesError when call GetMovies fails',
        () {
          when(mockGetMovies()).thenAnswer((_) async => Left(Failure()));
          final expect = [
            Loading(),
            Error('message'),
          ];
          expectLater(cubit.stream, emitsInOrder(expect));

          cubit.getMoviesList();

          verify(mockGetMovies());
        },
      );
      test(
        'should emits MoviesLoaded when call GetMovies success',
        () {
          when(mockGetMovies()).thenAnswer((_) async => Right([]));
          final expect = [
            Loading(),
            LoadedWithMovies([]),
          ];
          expectLater(cubit.stream, emitsInOrder(expect));

          cubit.getMoviesList();
        },
      );
    },
  );

  group(
    'getMovieWithDetails',
    () {
      final tId = 1;
      final movie = MovieModel(
          1, 'title', 'overview', 2.2, 'posterUrl', DateTime.now(), ['genres']);
      test(
        'should emits Error when call GetMovieDetials fails',
        () {
          //arrange
          when(mockGetMovieDetails(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          //assert
          final expected = [Loading(), Error('error')];
          expectLater(cubit.stream, emitsInOrder(expected));
          //act
          cubit.getMovieWithDetails(tId);

          verify(mockGetMovieDetails(tId));
        },
      );
      test(
        'should emits Loaded with movie when call GetMovieDetials success',
        () {
          //arrange
          when(mockGetMovieDetails(any)).thenAnswer((_) async => Right(movie));
          //assert
          final expected = [Loading(), LoadedWithMovieDetails(movie)];
          expectLater(cubit.stream, emitsInOrder(expected));
          //act
          cubit.getMovieWithDetails(tId);
        },
      );
    },
  );
}
