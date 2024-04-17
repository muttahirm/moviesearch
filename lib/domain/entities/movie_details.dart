import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final double popularity;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.popularity,
  });

  //Overrides the props getter method from the Equatable class
  //This method is used to define the list of properties that should be considered when
  //determining the equality of two instances of the Todo class
  @override
  List<Object?> get props => [id, title, overview, releaseDate, popularity];
}
