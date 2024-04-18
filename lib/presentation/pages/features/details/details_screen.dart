import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesearch/presentation/presentation.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
            listener: (context, state) {
              if (state is MovieDetailsLoadingFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is MovieDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
              if (state is MovieDetailsLoadingSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('ID: ${state.movie.id}'),
                      const VerticalSpacing(height: 8.0),
                      Text('Title: ${state.movie.title}'),
                      const VerticalSpacing(height: 8.0),
                      Text('Overview: ${state.movie.overview}'),
                      const VerticalSpacing(height: 8.0),
                      Text('Release Date: ${state.movie.releaseDate}'),
                      const VerticalSpacing(height: 8.0),
                      Text('Popularity: ${state.movie.popularity}'),
                      const VerticalSpacing(height: 8.0),
                      Text('Rating: ${state.movie.rating}'),
                      const VerticalSpacing(height: 8.0),
                    ],
                  ),
                );
              }
              return Container();
            },
          )),
    );
  }
}
