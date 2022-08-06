import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newwave_solutions_test/data/core/data_source/movie_remote_data_source.dart';
import 'package:newwave_solutions_test/data/core/repositories/movie_repository.dart';
import 'package:newwave_solutions_test/data/domain/usecases/get_popular/get_popular.dart';
import 'package:newwave_solutions_test/presentations/blocs/movie_popular_bloc/movie_popular_bloc.dart';

import '../../data/core/constants/dio_client.dart';
import '../module/network_module.dart';

final getInstance = GetIt.I;

Future<void> locator() async {
  // Dio:---------------------------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<Dio>(() => NetworkModule.provideDio());

  // DioClient:---------------------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<DioClient>(() => DioClient(getInstance()));

  //MovieRemoteDataSource:----------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getInstance()));

  //MovieRepository:----------------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getInstance()));

  //GetMoviePopular:----------------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<GetPopular>(() => GetPopular(getInstance()));

  //MoviePopularBloc:---------------------------------------------------------------------------------------------------
  getInstance.registerLazySingleton<MoviePopularBloc>(() => MoviePopularBloc(getInstance()));
}
