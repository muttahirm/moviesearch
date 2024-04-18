import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  // final List<Genres> genreList;
  // final DateTime releaseDate;
  final double rating;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    // required this.genreList,
    // required this.releaseDate,
    required this.rating,
  });

  //Overrides the props getter method from the Equatable class
  //This method is used to define the list of properties that should be considered when
  //determining the equality of two instances of the Todo class
  @override
  List<Object?> get props => [
        id, title, overview, posterPath, rating
        // , genreList, releaseDate
      ];
}
