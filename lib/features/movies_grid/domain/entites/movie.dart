import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final num voteAverage;
  final DateTime releaseDate;
  final List<String> genres;

  final String? posterUrl;
  final List<Actor>? actors;
  final int? runTime;
  final int? budget;
  final List<String>? gallaryImagesUrl;
  final int? revenue;
  final String? director;

  Movie(
    this.id,
    this.title,
    this.overview,
    this.voteAverage,
    this.posterUrl,
    this.releaseDate,
    this.genres, {
    this.runTime,
    this.actors,
    this.budget,
    this.gallaryImagesUrl,
    this.revenue,
    this.director,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        genres,
        voteAverage,
        posterUrl,
        budget,
        runTime,
        releaseDate,
        actors,
        gallaryImagesUrl,
        revenue,
        director,
      ];
}

class Actor extends Equatable {
  final String name;
  final String characterName;
  final String? imageUrl;

  Actor(
    this.name,
    this.characterName, {
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        characterName,
        imageUrl,
      ];
}
