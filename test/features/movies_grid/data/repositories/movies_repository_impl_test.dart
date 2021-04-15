import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/core/error/excpetions.dart';
import 'package:movies_gallery/core/error/failures.dart';
import 'package:movies_gallery/core/network/internet_info.dart';
import 'package:movies_gallery/features/movies_grid/data/data_source/movies_remote_DS.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movie_model.dart';
import 'package:movies_gallery/features/movies_grid/data/repositories/movies_repository_impl.dart';
import './movies_repository_impl_test.mocks.dart';

@GenerateMocks([InternetInfo, RemoteDS])
void main() {
  final mockInternetInfo = MockInternetInfo();
  final mockRemoteDS = MockRemoteDS();
  final repositoryImpl = MoviesRepositoryImpl(
    mockRemoteDS,
    mockInternetInfo,
  );

  final tMovies = <MovieModel>[];
  final tMovieDetail = MovieModel(1, 'title', 'overview', 2.2, 'posterUrl', DateTime(1), []);
  final tNumber = 1;
  group('getPopularityMovies', () {
    group(
      'we are online',
      () {
        setUp(() {
          when(mockInternetInfo.isConnect).thenAnswer((_) async => true);
        });
        test(
          'should call isConnect method',
          () async {
            //arrange
            when(mockInternetInfo.isConnect).thenAnswer((_) async => false);
            //act
            repositoryImpl.getPopularityMovies();
            //assert
            verify(mockInternetInfo.isConnect);
          },
        );
        test(
          'should return list of movieModel when call to server success',
          () async {
            //arrange
            when(mockRemoteDS.fetchPopularityMovies())
                .thenAnswer((_) async => tMovies);
            //act
            final result = await repositoryImpl.getPopularityMovies();
            //assert
            verify(mockRemoteDS.fetchPopularityMovies());
            expect(result, equals(Right(tMovies)));
          },
        );
        test(
          'should return ServerFailure when remoteDS throw an execption',
          () async {
            //arrange
            when(mockRemoteDS.fetchPopularityMovies())
                .thenThrow(ServerExcpetion());
            //act
            final result = await repositoryImpl.getPopularityMovies();
            //assert
            expect(result, Left(ServerFailure()));
          },
        );
      },
    );
    group(
      'we are offline',
      () {
        test(
          'should return InternetError when we are offline',
          () async {
            when(mockInternetInfo.isConnect).thenAnswer((_) async => false);
            //act
            final result = await repositoryImpl.getPopularityMovies();
            //assert
            expect(result, Left(InternetFailure()));
          },
        );
      },
    );
  });
  group('getMovieDetails', () {
    group(
      'we are online',
      () {
        setUp(() {
          when(mockInternetInfo.isConnect).thenAnswer((_) async => true);
        });
        test(
          'should call isConnect method',
          () async {
            //arrange
            when(mockInternetInfo.isConnect).thenAnswer((_) async => false);
            //act
            repositoryImpl.getMovieDetails(tNumber);
            //assert
            verify(mockInternetInfo.isConnect);
          },
        );
        test(
          'should return movieModel when call to server success',
          () async {
            //arrange
            when(mockRemoteDS.fetchMovieDetails(any))
                .thenAnswer((_) async => tMovieDetail);
            //act
            final result = await repositoryImpl.getMovieDetails(tNumber);
            //assert
            verify(mockRemoteDS.fetchMovieDetails(tNumber));
            expect(result, equals(Right(tMovieDetail)));
          },
        );
        test(
          'should return ServerFailure when remoteDS throw an execption',
          () async {
            //arrange
            when(mockRemoteDS.fetchMovieDetails(any))
                .thenThrow(ServerExcpetion());
            //act
            final result = await repositoryImpl.getMovieDetails(tNumber);
            //assert
            expect(result, Left(ServerFailure()));
          },
        );
      },
    );
    group(
      'we are offline',
      () {
        test(
          'should return InternetError when we are offline',
          () async {
            when(mockInternetInfo.isConnect).thenAnswer((_) async => false);
            //act
            final result = await repositoryImpl.getMovieDetails(tNumber);
            //assert
            expect(result, Left(InternetFailure()));
          },
        );
      },
    );
  });
}
