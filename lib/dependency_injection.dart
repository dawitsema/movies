import 'package:get_it/get_it.dart';
import 'package:movies/presentation/bloc/popular_movie_bloc/popular_movie_bloc.dart';

import 'core/network/network_info.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'domain/usecases/get_trending_movies.dart';
import 'domain/usecases/search_movies.dart';
import 'presentation/bloc/search_movie_bloc/search_movie_bloc.dart';
import 'presentation/bloc/trending_movie_bloc/trending_movie_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  //Bloc
  getIt.registerFactory(() => TrendingMovieBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => PopularMovieBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => SearchMovieBloc(searchMovie: getIt()));

  //Use cases
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovie(getIt()));

  //remote data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  //Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
        movieRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //Core
  getIt.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionchecker: getIt()));

  //External
  getIt.registerLazySingleton(() => http.Client());
}
