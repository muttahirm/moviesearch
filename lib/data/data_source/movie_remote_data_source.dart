// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:moviesearch/data/models/models.dart';
import 'package:moviesearch/data/models/movie_details_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> searchMovies(String query);
  Future<MovieDetailsModel> fetchMovieDetails(int movieId);
}
