// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/repositories/repositories.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies(
    this.repository,
  );

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
