import 'package:dartz/dartz.dart';
import 'package:newwave_solutions_test/data/core/response/movie_response.dart';
import 'package:newwave_solutions_test/data/domain/usecases/use_case_base.dart';

import '../../../core/repositories/movie_repository.dart';
import '../../entities/app_error.dart';
import '../../entities/no_params.dart';

class GetPopular extends UseCaseBase<MovieResponse, NoParams>{
  final MovieRepository repository;

  GetPopular(this.repository);

  @override
  Future<Either<AppError,MovieResponse>> call(NoParams params) async => await repository.getMoviePopular();
}