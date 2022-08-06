import '../models/movie_model.dart';

class MovieResponse {
  MovieResponse({
    required this.results,
  });
  late final List<MovieModel> results;

  MovieResponse.fromJson(Map<String, dynamic> json){
    results = List.from(json['results']).map((e)=>MovieModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}
