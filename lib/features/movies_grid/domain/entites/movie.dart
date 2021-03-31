import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String name;
  final String plot;
  final List<String> genres;
  final double rating;
  final String director;
  final String posterUrl;
  final int budget;
  final int runningTime;
  final DateTime releaseData;
  final List<Actor> actors;
  final List<String>? gallaryImagesUrl;
  final int? revenue;

  Movie(
    this.name,
    this.plot,
    this.genres,
    this.rating,
    this.director,
    this.posterUrl,
    this.budget,
    this.runningTime,
    this.releaseData,
    this.actors, {
    this.gallaryImagesUrl,
    this.revenue,
  });

  @override
  List<Object?> get props => [
        name,
        plot,
        genres,
        rating,
        director,
        posterUrl,
        budget,
        runningTime,
        releaseData,
        actors,
        gallaryImagesUrl,
        revenue,
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
  List<Object?> get props => [name, characterName, imageUrl];
}
