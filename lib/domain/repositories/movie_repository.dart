import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/domain/entities/entities.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId);
}
