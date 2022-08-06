
import 'package:dartz/dartz.dart';
import 'package:newwave_solutions_test/data/core/response/movie_response.dart';
import 'package:newwave_solutions_test/data/domain/usecases/get_popular/get_popular.dart';
import 'package:newwave_solutions_test/presentations/blocs/loading/loading_bloc.dart';

import '../../../data/domain/entities/app_error.dart';
import '../../../data/domain/entities/no_params.dart';
import '../base_view_bloc.dart';
import '../view_event.dart';
import '../view_state.dart';

class MoviePopularBloc extends BaseViewBloc<GetPopular> {
  final LoadingBloc loadingBloc;
  MoviePopularBloc(GetPopular useCase, this.loadingBloc) : super(useCase);

  @override
  Stream<ViewState> mapEventToState(ViewEvent event) async* {
    if (event is ViewEventInitial) {
      loadingBloc.add(StartLoading());
      Either<AppError, MovieResponse> eitherResponse = await useCase.call(NoParams());
      yield eitherResponse.fold((l) => Failure(l), (r) => Success(r));
      loadingBloc.add(FinishLoading());
    } else if (event is ErrorViewEvent) {
      loadingBloc.add(StartLoading());
      yield Failure(event.error);
      loadingBloc.add(FinishLoading());
    }
  }
}
