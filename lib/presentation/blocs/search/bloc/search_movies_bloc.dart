import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesearch/domain/entities/entities.dart';
import 'package:moviesearch/domain/usecases/usecases.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMoviesUsecase searchMoviesUsecase;
  SearchMoviesBloc({required this.searchMoviesUsecase})
      : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>((event, emit) async {
      emit(SearchMoviesLoading());
      final failureOrMovies = await searchMoviesUsecase(event.query);
      failureOrMovies.fold(
        (failure) => emit(SearchMoviesLoadingFailure(failure.toString())),
        (movie) => emit(SearchMoviesLoadingSuccess(movie)),
      );
    });
  }
}
