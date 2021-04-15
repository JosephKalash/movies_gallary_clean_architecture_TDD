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
    List<String> genres, {
    int? runTime,
    List<ActorModel>? actors,
    int? budget,
    List<String>? gallaryImagesUrl,
    int? revenue,
    String? director,
  }) : super(id, title, overview, voteAverage, posterUrl, releaseDate, genres,
            runTime: runTime,
            actors: actors,
            budget: budget,
            gallaryImagesUrl: gallaryImagesUrl,
            revenue: revenue,
            director: director);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  factory MovieModel.fromJsonWithDetails(Map<String, dynamic> json) =>
      _$MovieModelFromJsonWithDetails(json);
}

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    (json['vote_average'] as num).toDouble(),
    _buildImageUrl(json['poster_path'] as String?),
    DateTime.parse(json['release_date'] as String),
    _getGenresNameById(
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
    ),
  );
}

MovieModel _$MovieModelFromJsonWithDetails(Map<String, dynamic> json) {
  return MovieModel(
    json['id'] as int,
    json['title'] as String,
    json['overview'] as String,
    (json['vote_average'] as num).toDouble(),
    _buildImageUrl(json['poster_path'] as String?),
    DateTime.parse(json['release_date'] as String),
    (json['genres'] as List<Map<String, dynamic>>)
        .map((e) => e['name'] as String)
        .toList(),
    runTime: json['runtime'] as int?,
    budget: json['budget'] as int?,
    revenue: json['revenue'] as int?,
    actors: _getActorsFromJson(
        json['credits']['cast'] as List<Map<String, dynamic>>),
    director: _getDirectorFromJson(
        json['credits']['crew'] as List<Map<String, dynamic>>),
    gallaryImagesUrl: _getImagesUrlFromJson(
        json['images']['backdrops'] as List<Map<String, dynamic>>),
  );
}

List<String> _getImagesUrlFromJson(List<Map<String, dynamic>> json) {
  List<String> urls = [];
  var count = 0;
  for (var image in json) {
    urls.add(_buildImageUrl(image['file_path'] as String?)!);
    count++;
    if (count >= 4) break;
  }
  return urls;
}

String _getDirectorFromJson(List<Map<String, dynamic>> json) {
  String name = '';

  for (var personJson in json)
    if (personJson['job'] == 'Director') {
      name = personJson['name'];
      break;
    }
  return name;
}

List<ActorModel> _getActorsFromJson(List<Map<String, dynamic>> json) {
  List<ActorModel> actors = [];
  var count = 0;

  for (var actorJson in json) {
    actors.add(ActorModel.fromJson(actorJson));
    count++;
    if (count >= 10) break;
  }
  return actors;
}

String? _buildImageUrl(String? path) {
  if (path == null) return null;
  return '$IMAGE_API$path';
}

List<String> _getGenresNameById(List<int> ids) {
  final list = <String>[];
  for (var number in ids) {
    for (var map in GENRES)
      if (map['id'] == number) {
        list.add(map['name'] as String);
        break;
      }
  }
  return list;
}

ActorModel _$ActorModelFromJson(Map<String, dynamic> json) {
  return ActorModel(
    json['name'] as String,
    json['character'] as String,
    _buildImageUrl(json['profile_path'] as String?),
  );
}

Map<String, dynamic> _$ActorModelToJson(ActorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'characterName': instance.characterName,
      'imageUrl': instance.imageUrl,
    };
