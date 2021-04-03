import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/core/error/excpetions.dart';
import 'package:movies_gallery/core/error/failures.dart';
import 'package:movies_gallery/core/network/internet_info.dart';
import 'package:movies_gallery/features/movies_grid/data/data_source/movies_remote_DS.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movies_model.dart';
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

  test(
    'should call isConnect method',
    () async {
      //arrange
      when(mockInternetInfo.isConnect).thenAnswer((_) async => false);
      //act
      repositoryImpl.getMovies();
      //assert
      verify(mockInternetInfo.isConnect);
    },
  );
  group(
    'we are online',
    () {
      setUp(() {
        when(mockInternetInfo.isConnect).thenAnswer((_) async => true);
      });
      test(
        'should return list of movieModel when call to server success',
        () async {
          //arrange
          when(mockRemoteDS.fetchMovies()).thenAnswer((_) async => tMovies);
          //act
          final result = await repositoryImpl.getMovies();
          //assert
          verify(mockRemoteDS.fetchMovies());
          expect(result, equals(Right(tMovies)));
        },
      );
      test(
        'should return ServerFailure when remoteDS throw an execption',
        ()async {
          //arrange
          when(mockRemoteDS.fetchMovies()).thenThrow(ServerExcpetion());
          //act
          final result = await repositoryImpl.getMovies();
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
          final result = await repositoryImpl.getMovies();
          //assert
          expect(result, Left(InternetFailure()));
        },
      );
    },
  );
}
