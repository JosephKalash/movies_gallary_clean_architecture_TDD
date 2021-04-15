import 'package:dio/dio.dart';

import '../../../../core/constans.dart';
import '../../../../core/error/excpetions.dart';
import '../models/movie_model.dart';

abstract class RemoteDS {
  Future<List<MovieModel>> fetchPopularityMovies();
}

class RemoteDSImpl extends RemoteDS {
  final Dio dio;

  RemoteDSImpl(this.dio);

  final url = 'http://api.themoviedb.org/3/discover/movie';
//https://api.themoviedb.org/3/movie/$id?api_key=$API_KEY&append_to_response=images

  @override
  Future<List<MovieModel>> fetchPopularityMovies() async {
    final response = await dio.get(
      url,
      queryParameters: {
        'api_key': API_KEY,
        'page': 1,
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
}
