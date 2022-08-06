
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newwave_solutions_test/data/core/response/movie_response.dart';
import 'package:newwave_solutions_test/di/component/locator.dart';
import 'package:newwave_solutions_test/presentations/blocs/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_event.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_state_builder.dart';

class MoviePopular extends StatefulWidget {
  const MoviePopular({Key? key}) : super(key: key);

  @override
  State<MoviePopular> createState() => _MoviePopularState();
}

class _MoviePopularState extends State<MoviePopular> {
  late MoviePopularBloc _moviePopularBloc;

  @override
  void initState() {
    _moviePopularBloc = getInstance<MoviePopularBloc>();
    _moviePopularBloc.add(ViewEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ViewStateBuilder<MovieResponse, MoviePopularBloc>(
        cubit: _moviePopularBloc,
        onSuccess: (context, state) {
          return SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Text(state.results.toString()),
          );
        },
      ),
    );
  }
}
