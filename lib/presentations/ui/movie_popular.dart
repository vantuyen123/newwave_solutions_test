import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newwave_solutions_test/common/string_extensions.dart';
import 'package:newwave_solutions_test/data/core/constants/api_constants.dart';
import 'package:newwave_solutions_test/data/core/models/movie_model.dart';
import 'package:newwave_solutions_test/data/core/response/movie_response.dart';
import 'package:newwave_solutions_test/di/component/locator.dart';
import 'package:newwave_solutions_test/presentations/blocs/movie_popular_bloc/movie_popular_bloc.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_event.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_state_builder.dart';

import 'components/item_movie_popular.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('assets/pngs/back_chevron.png'),
            Container(
                margin: EdgeInsets.only(left: 16.w),
                child: Text(
                  'Back',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFPro', fontSize: 20.sp, fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
      body: ViewStateBuilder<MovieResponse, MoviePopularBloc>(
        cubit: _moviePopularBloc,
        onSuccess: (context, state) {
          return Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            width: ScreenUtil().screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Popular list', style: TextStyle(color: const Color(0xFF666666), fontSize: 20.sp)),
                SizedBox(height: 20.h),
                Expanded(
                    child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 30.h),
                  itemCount: state.results.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var movie = state.results[index];
                    return Container(
                        padding: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ]
                        ),
                        child: ItemMoviePopular(movie: movie));
                  },
                )),
              ],
            ),
          );
        },
      ),
    );
  }
}

