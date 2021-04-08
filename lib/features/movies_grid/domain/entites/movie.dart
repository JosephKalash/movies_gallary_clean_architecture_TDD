import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String overview;
  final double voteAverage;
  final String posterUrl;
  final DateTime releaseDate;

  final List<String>? genres;
  final List<Actor>? actors;
  final int? runTime;
  final int? budget;
  final List<String>? gallaryImagesUrl;
  final int? revenue;
  final String? director;

  set genres(List<String>? genres) {
    this.genres = genres;
  }

  set budget(int? budget) {
    this.budget = budget;
  }

  set runTime(int? runTime) {
    this.runTime = runTime;
  }

  set revenue(int? revenue) {
    this.revenue = revenue;
  }

  set actors(List<Actor>? actors) {
    this.actors = actors;
  }

  set director(String? director) {
    this.director = director;
  }

  set gallaryImagesUrl(List<String>? gallaryImagesUrl) {
    this.gallaryImagesUrl = gallaryImagesUrl;
  }

  Movie(
    this.title,
    this.overview,
    this.voteAverage,
    this.posterUrl,
    this.releaseDate, {
    this.genres,
    this.runTime,
    this.actors,
    this.budget,
    this.gallaryImagesUrl,
    this.revenue,
    this.director,
  });

  @override
  List<Object?> get props => [
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
