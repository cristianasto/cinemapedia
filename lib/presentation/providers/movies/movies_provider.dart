

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getNowPlaying();
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);

});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getPopular();
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);

});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getTopRated();
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);

});


final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){

  final fetchMoreMovies = ref.watch(moviesRepositoryProvider).getUpcoming();
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);

});



class MoviesNotifier extends StateNotifier<List<Movie>> {

  int currentPage = 1;
  bool isLoading = true;
  Future<List<Movie>> fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }):super([]);


  Future<void> loadNextPage() async {
    final movies = await fetchMoreMovies;
    state = [...state, ...movies];
    currentPage ++;
    isLoading = false;
  }
}