import 'package:dio/dio.dart';

import '../../../../core/utils/constans.dart';
import '../../../../core/error/excpetions.dart';
import '../models/movie_model.dart';

abstract class RemoteDS {
  Future<List<MovieModel>> fetchPopularityMovies();
  Future<MovieModel> fetchMovieDetails(int id);
}

const MOVIE_DISCOVER_URL = 'http://api.themoviedb.org/3/discover/movie';
const MOVIE_URL = 'https://api.themoviedb.org/3/movie/';

class RemoteDSImpl extends RemoteDS {
  static int _pageNum = 1;
  final Dio dio;

  RemoteDSImpl(this.dio);

  @override
  Future<List<MovieModel>> fetchPopularityMovies() async {
    final response = await dio.get(
      MOVIE_DISCOVER_URL,
      queryParameters: {
        'api_key': API_KEY,
        'page': _pageNum,
        'language': 'en-US',
        'include_adult': false,
        'include_video': false,
        'sort_by': 'popularity.desc',
      },
    );
    if (response.statusCode == 200) {
      return _returnMoviesFromResponse(response);
    } else {
      throw ServerExcpetion();
    }
  }

  List<MovieModel> _returnMoviesFromResponse(Response<dynamic> response) {
    final data = response.data;
    final result = data['results'] as List<dynamic>;
    final movies = result.map((e) => MovieModel.fromJson(e)).toList();
    return movies;
  }

  MovieModel _returnMovieDetailsFromResponse(Response<dynamic> response) {
    final data = response.data as Map<String, dynamic>;
    final movie = MovieModel.fromJsonWithDetails(data);
    return movie;
  }

  @override
  Future<MovieModel> fetchMovieDetails(int id) async {
    final url = '$MOVIE_URL$id';
    final response = await dio.get(
      url,
      queryParameters: {
        'api_key': API_KEY,
        'append_to_response': 'images,credits',
      },
    );
    if (response.statusCode == 200) {
      final movie = _returnMovieDetailsFromResponse(response);
      return movie;
    } else {
      throw ServerExcpetion();
    }
  }
}
