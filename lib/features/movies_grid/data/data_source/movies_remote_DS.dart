import 'package:dio/dio.dart';

import '../../../../core/constans.dart';
import '../../../../core/error/excpetions.dart';
import '../models/movies_model.dart';

abstract class RemoteDS {
  Future<List<MovieModel>> fetchMovies();
}

class RemoteDSImpl extends RemoteDS {
  final Dio dio;

  RemoteDSImpl(this.dio);

  @override
  Future<List<MovieModel>> fetchMovies() async {
    final url = 'http://api.themoviedb.org/3/discover/movie';
    final response = await dio.get(url, queryParameters: {
      'api_key': API_KEY,
      'page': 1,
    },);
    if (response.statusCode == 200) {
      return _returnMoviesFromDataa(response);
    } else {
      throw ServerExcpetion();
    }
  }

  List<MovieModel> _returnMoviesFromDataa(Response<dynamic> response) {
    final data = response.data;
    final result = data['results'] as List<dynamic>;
    final movies = result.map((e) => MovieModel.fromJson(e)).toList();
    return movies;
  }
}
