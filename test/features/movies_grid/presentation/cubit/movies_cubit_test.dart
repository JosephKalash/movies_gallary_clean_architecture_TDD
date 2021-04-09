import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/core/error/failures.dart';
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movies_usecase.dart';
import 'package:movies_gallery/features/movies_grid/presentation/cubit/movies_cubit.dart';
import './movies_cubit_test.mocks.dart';

@GenerateMocks([GetMovies])
void main() {
  final mockGetMovies = MockGetMovies();
  final cubit = MoviesCubit(mockGetMovies);

  group(
    'getMovies',
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
        },
      ); test(
        'should emits MoviesLoaded when call GetMovies success',
        () {
          when(mockGetMovies()).thenAnswer((_) async => Right([]));
          final expect = [
            Loading(),
            Loaded([]),
          ];
          expectLater(cubit.stream, emitsInOrder(expect));

          cubit.getMoviesList();
        },
      );
    },
  );
}
