part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent {}

class FetchMovieDetails extends MovieDetailsEvent {
  final int movieId;

  FetchMovieDetails(this.movieId);
}
