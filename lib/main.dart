import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesearch/bloc_observer.dart';
import 'package:moviesearch/injection_container.dart';

import 'presentation/presentation.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchMoviesBloc>(),
      child: MaterialApp(
        title: 'Movie Search',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SearchMovieScreen(),
      ),
    );
  }
}
