// Mocks generated by Mockito 5.0.3 from annotations
// in movies_gallery/test/features/movies_grid/presentation/cubit/movies_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movies_gallery/core/error/failures.dart' as _i5;
import 'package:movies_gallery/features/movies_grid/domain/entites/movie.dart'
    as _i6;
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movie_details.dart'
    as _i7;
import 'package:movies_gallery/features/movies_grid/domain/usecases/get_movies_usecase.dart'
    as _i3;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [GetMovies].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovies extends _i1.Mock implements _i3.GetMovies {
  MockGetMovies() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  Future.value(_FakeEither<_i5.Failure, List<_i6.Movie>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Movie>>>);
}

/// A class which mocks [GetMovieDetails].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieDetails extends _i1.Mock implements _i7.GetMovieDetails {
  MockGetMovieDetails() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Movie>> call(int? id) =>
      (super.noSuchMethod(Invocation.method(#call, [id]),
              returnValue: Future.value(_FakeEither<_i5.Failure, _i6.Movie>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Movie>>);
}
