import 'package:moviesearch/domain/entities/entities.dart';

class MovieModel {
  int id;
  String title;
  String overview;
  String posterPath;
  // List<Genres> genreList;
  // DateTime releaseDate;
  double rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    // required this.genreList,
    // required this.releaseDate,
    required this.rating,
  });

  //convert JSON to MovieModal
  //JSON Deserialization
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        // genreList: json['genre_ids'],
        // releaseDate: json['release_date'],
        rating: json['vote_average']);
    // );
  }

  //convert MoviModel to JSON
  //JSON Serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      // 'genre_ids': genreList,
      // 'release_date': releaseDate,
      'vote_average': rating,
    };
  }

  //convert movie to entity
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      // genreList: genreList,
      // releaseDate: releaseDate,
      rating: rating,
    );
  }
}
