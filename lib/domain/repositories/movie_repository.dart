import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/data/models/movie_details_model.dart';
import 'package:moviesearch/domain/entities/entities.dart';

abstract class MovieRepository {
  // Future<Either<Failure, List<Movie>>> getTrendingMovies();
  // Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(int movieId);
}
