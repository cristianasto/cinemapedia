 



import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // final initialLoading = ref.watch(initialLoadingProvider);

    // if(initialLoading) {
    //   return const Scaffold(
    //   body: FullScreenLoader(),
    // );
    // }
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}


class _HomeView extends ConsumerStatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    
    return SingleChildScrollView(
      child: Column(
        children: [

          const CustomAppbar(),
    
          MoviesSlideshow(movies: slideshowMovies),
    
          MoviesHorizontalListview(movies: nowPlayingMovies, title: 'En cines', subTitle: 'Ver mas',),

          MoviesHorizontalListview(movies: popularMovies, title: 'Populares', subTitle: 'Ver mas',),

          MoviesHorizontalListview(movies: topRatedMovies, title: 'Los mas valorados', subTitle: 'Ver mas',),

          MoviesHorizontalListview(movies: upcomingMovies, title: 'Proximos', subTitle: 'Ver mas',),

        ],
      ),  
    );
  }
}