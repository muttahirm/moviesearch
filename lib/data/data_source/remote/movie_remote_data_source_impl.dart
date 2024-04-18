// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviesearch/core/error/error.dart';
import 'package:moviesearch/data/data_source/movie_remote_data_source.dart';
import 'package:moviesearch/data/models/models.dart';
import 'package:moviesearch/data/models/movie_details_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({
    required this.client,
  });

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "ea17a4597efff89db3eee641bad4ce56";

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    final response = await client.get(
        Uri.parse("$BASE_URL/movie/$movieId?language=en-US&api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      final MovieDetailsModel movieDetails = MovieDetailsModel(
        id: responseBody['id'],
        title: responseBody['title'],
        overview: responseBody['overview'],
        posterPath: responseBody['poster_path'],
        releaseDate: responseBody['release_date'],
        popularity: responseBody['popularity'],
        rating: responseBody['vote_average'],
      );
      return movieDetails;
    } else {
      throw ServerException();
    }
  }
}
