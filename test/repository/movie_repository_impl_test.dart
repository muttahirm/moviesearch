import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/data/data.dart';
import 'package:moviesearch/data/data_source/data.source.dart';
import 'package:moviesearch/data/repositories/repositories.dart';
import 'package:moviesearch/domain/entities/entities.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  const String tQuery = "Avengers";

  final tMoviesModelList = [
    MovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1",
        rating: 5.0),
    MovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2",
        rating: 6.2),
  ];

  const tMoviesList = [
    Movie(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1",
        rating: 5.0),
    Movie(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2",
        rating: 6.2),
  ];

  test('should get a movie from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.searchMovies(tQuery);
    // assert
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDataSource.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test(
      'should return a server failure when the call to the remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());
    // act
    final result = await repository.searchMovies(tQuery);
    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
    expect(result.fold(id, id), isA<ServerFailure>());
  });
}
