// Mocks generated by Mockito 5.4.4 from annotations
// in moviesearch/test/repository/movie_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:moviesearch/data/data_source/movie_remote_data_source.dart'
    as _i3;
import 'package:moviesearch/data/models/models.dart' as _i5;
import 'package:moviesearch/data/models/movie_details_model.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieDetailsModel_0 extends _i1.SmartFake
    implements _i2.MovieDetailsModel {
  _FakeMovieDetailsModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i3.MovieRemoteDataSource {
  @override
  _i4.Future<List<_i5.MovieModel>> searchMovies(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i4.Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.MovieModel>>.value(<_i5.MovieModel>[]),
      ) as _i4.Future<List<_i5.MovieModel>>);

  @override
  _i4.Future<_i2.MovieDetailsModel> fetchMovieDetails(int? movieId) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchMovieDetails,
          [movieId],
        ),
        returnValue:
            _i4.Future<_i2.MovieDetailsModel>.value(_FakeMovieDetailsModel_0(
          this,
          Invocation.method(
            #fetchMovieDetails,
            [movieId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.MovieDetailsModel>.value(_FakeMovieDetailsModel_0(
          this,
          Invocation.method(
            #fetchMovieDetails,
            [movieId],
          ),
        )),
      ) as _i4.Future<_i2.MovieDetailsModel>);
}