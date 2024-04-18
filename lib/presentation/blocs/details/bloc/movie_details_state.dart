part of 'movie_details_bloc.dart';

sealed class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoadingSuccess extends MovieDetailsState {
  final MovieDetails movie;
  MovieDetailsLoadingSuccess(this.movie);
}

class MovieDetailsLoadingFailure extends MovieDetailsState {
  final String message;
  MovieDetailsLoadingFailure(this.message);
}
