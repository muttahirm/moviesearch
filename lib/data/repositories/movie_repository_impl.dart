import 'package:dartz/dartz.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/data/data_source/movie_remote_data_source.dart';
import 'package:moviesearch/data/models/models.dart';
import 'package:moviesearch/data/models/movie_details_model.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/repositories/repositories.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.searchMovies(query);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> fetchMovieDetails(int movieId) async {
    try {
      final MovieDetailsModel movieDetails =
          await remoteDataSource.fetchMovieDetails(movieId);
      return Right(movieDetails.toEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
