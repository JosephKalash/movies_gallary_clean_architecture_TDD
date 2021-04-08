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
    String title,
    String overview,
    double voteAverage,
    String posterUrl,
     DateTime releaseDate,
     // {
    //List<String> genres,
    // int? runTime,
    // List<ActorModel>? actors,
    // int? budget,
    // List<String>? gallaryImagesUrl,
    // int? revenue,
    // String? director,}
  ) : super(
          title,
          overview,
          voteAverage,
          posterUrl,
          releaseDate,
          //genres,
          // runTime: runTime,
          // actors: actors,
          // budget: budget,
          // gallaryImagesUrl: gallaryImagesUrl,
          // revenue: revenue,
          // director: director,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['title'] as String,
    json['overview'] as String,
    (json['vote_average'] as num).toDouble(),
    json['poster_path'] as String,
    DateTime.parse(json['release_date'] as String),
  );
}

_buildImagesUrl(String path) {
  const MOVIE_API = 'https://api.themoviedb.org/3/movie/{movie_id}/images?api_key=$API_KEY&language=en-US';
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

// (json['genres'] as List<dynamic>)
//         .map((e) => (e['name'] as String))
//         .toList(),
// runTime: json['runtime'] as int?,
// actors: ((json['actors'] as List<dynamic>?)
//     ?.map((e) => ActorModel.fromJson(e))
//     .toList()),
// budget: json['budget'] as int?,
// revenue: json['revenue'] as int?,
// director: json['director'] as String?,
