import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:newwave_solutions_test/data/core/response/movie_response.dart';

import '../../domain/entities/app_error.dart';
import '../data_source/movie_remote_data_source.dart';

abstract class MovieRepository {
  Future<Either<AppError, MovieResponse>> getMoviePopular();
}

class MovieRepositoryImpl extends MovieRepository {

  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, MovieResponse>> getMoviePopular() async {
    try {
      final movies = await remoteDataSource.getMoviePopular();
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
