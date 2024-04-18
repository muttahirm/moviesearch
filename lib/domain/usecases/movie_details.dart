import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/repositories/repositories.dart';

class FetchMovieDetailsUsecase {
  final MovieRepository repository;
  FetchMovieDetailsUsecase(
    this.repository,
  );

  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await repository.fetchMovieDetails(movieId);
  }
}
