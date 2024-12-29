import 'package:flutter/material.dart';
import 'package:movies/dependency_injection.dart';
import 'package:movies/presentation/pages/home_screen.dart';
import 'package:movies/presentation/bloc/popular_movie_bloc/popular_movie_bloc.dart';
import 'package:movies/presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:movies/presentation/bloc/search_movie_bloc/search_movie_bloc.dart';
import 'package:movies/presentation/bloc/popular_movie_bloc/popular_movie_event.dart';
import 'package:movies/presentation/bloc/trending_movie_bloc/trending_movie_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PopularMovieBloc>()..add(FetchPopularMovie()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMovieBloc>()..add(FetchTrendingMovieEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchMovieBloc>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
