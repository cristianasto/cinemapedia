


import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasource/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/tmdb/tmdb_response.dart';
import 'package:dio/dio.dart';

class TmdbDatasource extends MoviesDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.tmdbKey,
      'language': 'es-ES'
    }
  ));

  List<Movie> _jsontoMovies(Map<String, dynamic> json){
    final tmdbNowPlayingResponse = TmdbResponse.fromJson(json);

    final List<Movie> movies = tmdbNowPlayingResponse.results
    .where((movieTmdb) => movieTmdb.posterPath != 'no-poster') 
    .map((movieTmdb) => MovieMapper.movieTmdbEntity(movieTmdb)).toList();

    return movies;
  }




  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing', queryParameters: {'page': page});

    return _jsontoMovies(response.data);
  }


  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});

    return _jsontoMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {

    final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});

    return _jsontoMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    
    final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});

    return _jsontoMovies(response.data);
  }
  
}

