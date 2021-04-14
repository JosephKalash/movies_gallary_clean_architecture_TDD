import 'package:movies_gallery/core/constans.dart';

import '../../domain/entites/movie.dart';

class ActorModel extends Actor {
  ActorModel(
    String name,
    String characterName,
    String? imageUrl,
  ) : super(name, characterName, imageUrl: imageUrl);

  factory ActorModel.fromJson(Map<String, dynamic> json) =>
      _$ActorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActorModelToJson(this);
}

class MovieModel extends Movie {
  MovieModel(
    int id,
    String title,
    String overview,
    double voteAverage,
    String? posterUrl,
    DateTime releaseDate,
    List<String> genres,
  ) : super(id, title, overview, voteAverage, posterUrl, releaseDate, genres);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    (json['vote_average'] as num).toDouble(),
    _getPosterUrl(json['poster_path'] as String?),
    DateTime.parse(json['release_date'] as String),
    _getGenresName(
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    ),
  );
}

String? _getPosterUrl(String? path) {
  if (path == null) return null;
  return '$IMAGE_API$path';
}

List<String> _getGenresName(List<int> data) {
  final list = <String>[];
  for (var number in data) {
    for (var map in GENRES)
      if (map['id'] == number) {
        list.add(map['name'] as String);
        break;
      }
  }
  return list;
}

_buildImagesUrl(String path) {
  const MOVIE_API =
      'https://api.themoviedb.org/3/movie/550/images?api_key=$API_KEY&language=en-US';
}

ActorModel _$ActorModelFromJson(Map<String, dynamic> json) {
  return ActorModel(
    json['name'] as String,
    json['characterName'] as String,
    json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$ActorModelToJson(ActorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'characterName': instance.characterName,
      'imageUrl': instance.imageUrl,
    };
