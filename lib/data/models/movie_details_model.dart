import 'package:moviesearch/domain/entities/entities.dart';

class MovieDetailsModel {
  int id;
  String title;
  String overview;
  String posterPath;
  String releaseDate;
  double popularity;
  double rating;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.popularity,
    required this.rating,
  });

  //convert JSON to MovieDetailsModal
  //JSON Deserialization
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'],
        popularity: json['popularity'],
        rating: json['vote_average']);
    // );
  }

  //convert MovieDetailsModel to JSON
  //JSON Serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'popularity': popularity,
      'vote_average': rating,
    };
  }

  //convert movie details to entity
  MovieDetails toEntity() {
    return MovieDetails(
        id: id,
        title: title,
        overview: overview,
        releaseDate: releaseDate,
        popularity: popularity,
        rating: rating);
  }
}
