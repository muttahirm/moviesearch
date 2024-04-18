import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/usecases/usecases.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final FetchMovieDetailsUsecase fetchMovieDetailsUsecase;
  MovieDetailsBloc({required this.fetchMovieDetailsUsecase})
      : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>((event, emit) async {
      emit(MovieDetailsLoading());
      final failureOrMovieDetails =
          await fetchMovieDetailsUsecase(event.movieId);

      failureOrMovieDetails.fold(
        (failure) => emit(MovieDetailsLoadingFailure(failure.toString())),
        (movieDetails) => emit(MovieDetailsLoadingSuccess(movieDetails)),
      );
    });
  }
}
