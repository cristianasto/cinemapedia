

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/tmdb/movie_tmdb.dart';

class MovieMapper {
  
  static Movie movieTmdbEntity(MovieTmdb movieTmdb)=> Movie(
    adult: movieTmdb.adult, 
    backdropPath: movieTmdb.backdropPath != '' ?'https://image.tmdb.org/t/p/w500${movieTmdb.backdropPath}' :'https://uniscjsa.edu.pe/wp-content/uploads/2023/08/placeholder.png', 
    genreIds: movieTmdb.genreIds.map((e) => e.toString()).toList(),
    id: movieTmdb.id,
    originalLanguage: movieTmdb.originalLanguage, 
    originalTitle: movieTmdb.originalTitle, 
    overview: movieTmdb.overview, 
    popularity: movieTmdb.popularity, 
    posterPath: movieTmdb.posterPath != '' ? 'https://image.tmdb.org/t/p/w500${movieTmdb.posterPath}' : 'no-poster', 
    releaseDate: movieTmdb.releaseDate, 
    title: movieTmdb.title, 
    video: movieTmdb.video, 
    voteAverage: movieTmdb.voteAverage, 
    voteCount: movieTmdb.voteCount, 
  ); 

}