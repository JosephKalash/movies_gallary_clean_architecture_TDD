import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_gallery/core/utils/constans.dart';
import 'package:movies_gallery/core/error/excpetions.dart';
import 'package:movies_gallery/features/movies_grid/data/data_source/movies_remote_DS.dart';
import 'package:movies_gallery/features/movies_grid/data/models/movie_model.dart';
import './movies_remote_DS_test.mocks.dart';

@GenerateMocks([dio.Dio])
void main() {
  final mockDio = MockDio();
  final remoteDS = RemoteDSImpl(mockDio);

  final response = {
    "results": [
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
    ],
  };
  final responseDetails = {
        "id": 1,
        "genres": [
          {'name': 'Action'}
        ],
        "overview":
            "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
        "poster_path": "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
        "release_date": "2021-03-24",
        "title": "Godzilla vs. Kong",
        "vote_average": 8.4,
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
          'crew': [
            {'job': 'Director', 'name': 'joseph'}
          ]
        },
        'images': {
          'backdrops': [
            {'file_path': 'image'}
          ]
        },
  };

  final movies = <MovieModel>[
    MovieModel.fromJson(
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
    ),
  ];
  final movieDetails = MovieModel.fromJsonWithDetails(
    {
      "id": 1,
      "genres": [
        {'name': 'Action'}
      ],
      "overview":
          "In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.",
      "poster_path": "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
      "release_date": "2021-03-24",
      "title": "Godzilla vs. Kong",
      "vote_average": 8.4,
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
        'crew': [
          {'job': 'Director', 'name': 'joseph'}
        ]
      },
      'images': {
        'backdrops': [
          {'file_path': 'image'}
        ]
      },
    },
  );
  final tNumber = 1;
  void _setupDioGetSuccess(response) {
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => dio.Response(
        data: response,
        statusCode: 200,
        requestOptions: dio.RequestOptions(path: ''),
      ),
    );
  }

  void _setupDioGetFail() {
    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => dio.Response(
        data: 'error',
        statusCode: 400,
        requestOptions: dio.RequestOptions(path: ''),
      ),
    );
  }

  group(
    'fetchPopularityMovies',
    () {
      test(
        'should call dio.get with proper parameters',
        () async {
          //arrange
          _setupDioGetSuccess(response);
          //act
          await remoteDS.fetchPopularityMovies();
          //assert
          verify(
            mockDio.get(MOVIE_DISCOVER_URL, queryParameters: {
              'api_key': API_KEY,
              'page': 1,
              'language': 'en-US',
              'include_adult': false,
              'include_video': false,
              'sort_by': 'popularity.desc',
            }),
          );
        },
      );
      test(
        'should return movies list',
        () async {
          //arrange
          _setupDioGetSuccess(response);
          //act
          final result = await remoteDS.fetchPopularityMovies();
          //assert

          expect(result, movies);
        },
      );
      test(
        'should throw a ServerException when dio.get fails',
        () {
          //arrange
          _setupDioGetFail();
          //act
          final call = remoteDS.fetchPopularityMovies;
          //assert
          expect(() => call(), throwsA(isInstanceOf<ServerExcpetion>()));
        },
      );
    },
  );

  group(
    'fetchMovieDetails',
    () {
      test(
        'should call dio.get with proper parameters',
        () async {
          //arrange
          _setupDioGetSuccess(responseDetails);
          //act
          await remoteDS.fetchMovieDetails(tNumber);
          //assert
          final url = '$MOVIE_URL$tNumber';
          verify(
            mockDio.get(url, queryParameters: {
              'api_key': API_KEY,
              'append_to_response': 'images,credits'
            }),
          );
        },
      );
      test(
        'should return movie with all details',
        () async {
          //arrange
          _setupDioGetSuccess(responseDetails);
          //act
          final result = await remoteDS.fetchMovieDetails(tNumber);
          //assert

          expect(result, movieDetails);
        },
      );
      test(
        'should throw a ServerException when dio.get fails',
        () {
          //arrange
          _setupDioGetFail();
          //act
          final call = remoteDS.fetchPopularityMovies;
          //assert
          expect(() => call(), throwsA(isInstanceOf<ServerExcpetion>()));
        },
      );
    },
  );
}
