import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/repositories/repositories.dart';

class SearchMoviesUsecase {
  final MovieRepository repository;
  SearchMoviesUsecase(
    this.repository,
  );

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
