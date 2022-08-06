
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newwave_solutions_test/common/string_extensions.dart';

import '../../../data/core/constants/api_constants.dart';
import '../../../data/core/models/movie_model.dart';

class ItemMoviePopular extends StatelessWidget {
  const ItemMoviePopular({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                ApiConstants.baseImageUrl + movie.posterPath,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black,
                ],
                stops: const [0.0, 1.0],
              )),
        ),
        Positioned(
          bottom: 12.h,
          left: 12.w,
          right: 5.w,
          child: SizedBox(
            width: ScreenUtil().screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.releaseDate.toIntelliTrim4Character(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFPro',
                    color: Colors.white,
                  ),
                ),
                Text(
                  movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SFPro',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 15.h,
          right: 10.w,
          child: buildVoteAverage(),
        )
      ],
    );
  }

  Widget buildVoteAverage() {
    final splitted = movie.voteAverage?.split('');
    var subText = '';
    for (int i = 0; i < splitted!.length; i++) {
      if (i > 0) {
        subText = subText + splitted[i];
      }
    }
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/pngs/combied_shape.png'))),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: splitted.first, style: TextStyle(fontSize: 20.sp)),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0, -2),
                child: Text(
                  subText,
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
