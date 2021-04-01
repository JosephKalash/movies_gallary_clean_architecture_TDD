import 'package:json_annotation/json_annotation.dart';
import 'package:movies_gallery/features/movies_grid/domain/entites/movie.dart';
part 'movies_model.g.dart';

@JsonSerializable()
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

@JsonSerializable()
class MovieModel extends Movie {
  MovieModel(
    String name,
    String plot,
    List<String> genres,
    double rating,
    String director,
    String posterUrl,
    int budget,
    int runningTime,
    DateTime releaseDate,
    List<ActorModel> actors,
    List<String>? gallaryImagesUrl,
    int? revenue,
  ) : super(name, plot, genres, rating, director, posterUrl, budget,
            runningTime, releaseDate, actors,
            gallaryImagesUrl: gallaryImagesUrl, revenue: revenue);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
