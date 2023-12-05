

import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';


class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({
    super.key,
    required this.movies
  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 20),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Color.fromARGB(255, 121, 121, 121),
            size: 6,
            activeSize: 6
          )
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return _Slide(movie: movie);
        },
      ),
    );
  }
}



class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 100),
            placeholder: const AssetImage('assets/images/poster_horizontal.gif'),
            image: NetworkImage(movie.backdropPath)
          ),
        ),
      ),
    );
  }
}