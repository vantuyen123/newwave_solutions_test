import 'package:newwave_solutions_test/data/core/response/movie_response.dart';

import '../constants/dio_client.dart';

abstract class MovieRemoteDataSource {
  Future<MovieResponse> getMoviePopular();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final DioClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<MovieResponse> getMoviePopular() async {
    final response = await _client.get('movie/popular');
    final movies = MovieResponse.fromJson(response);
    return movies;
  }
}
