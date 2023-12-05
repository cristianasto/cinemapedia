

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const   MoviesHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            if(title != null || subTitle != null)
              _Title(title: title, subTitle: subTitle,),
            
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return _Slide(movie: movie, index: index,);
                },
              )
            )
      
          ],
        ),
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final Movie movie;
  final int index;

  const _Slide({
    required this.movie,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == 0? const EdgeInsets.only(left: 17 ) : const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 129,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage(
                    width: 129,
                    height: 185,
                    fadeInDuration: const Duration(milliseconds: 100),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/poster_vertical.gif'),
                    image: NetworkImage(movie.posterPath)
                  ),
                ),

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 38,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 94, 3),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topRight: Radius.circular(5))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star_rounded, size: 13,),
                        Text(
                          movie.voteAverage.toString().substring(0,3), 
                          style: const TextStyle(fontSize: 13, color: Colors.white),
                        )
                      ],
                    )
                  )
                ),
              ],
            )
          ),

          SizedBox(
            width: 129,
            child: Text(
              movie.title.length > 18 ? '${movie.title.substring(0,10)}...' : movie.title,
        
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          if(title != null)
            Text(title!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),

          const Spacer(),

          if(title != null)
            Text(subTitle!)
        ]
      ),
    );
  }
}



