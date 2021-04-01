// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['name'] as String,
    json['plot'] as String,
    (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    (json['rating'] as num).toDouble(),
    json['director'] as String,
    json['posterUrl'] as String,
    json['budget'] as int,
    json['runningTime'] as int,
    DateTime.parse(json['releaseDate'] as String),
    (json['actors'] as List<dynamic>)
        .map((e) => ActorModel.fromJson(e))
        .toList(),
    (json['gallaryImagesUrl'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    json['revenue'] as int?,
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'plot': instance.plot,
      'genres': instance.genres,
      'rating': instance.rating,
      'director': instance.director,
      'posterUrl': instance.posterUrl,
      'budget': instance.budget,
      'runningTime': instance.runningTime,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'actors': instance.actors.map((e) => (e as ActorModel).toJson()).toList(),
      'gallaryImagesUrl': instance.gallaryImagesUrl,
      'revenue': instance.revenue,
    };
