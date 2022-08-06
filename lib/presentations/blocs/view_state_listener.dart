import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_state.dart';

typedef LoadingCallback = void Function(BuildContext context);

typedef SuccessCallback<T> = void Function(BuildContext context, T data);

typedef RefreshingCallback<T> = void Function(BuildContext context, T data);

typedef EmptyCallback = void Function(BuildContext context);

typedef ErrorCallback = void Function(
    BuildContext context,
    dynamic error,
    );

typedef ViewStateListenerCondition = bool Function(
    ViewState previous,
    ViewState current,
    );

class ViewStateListener<T, C extends BlocBase<ViewState>>
    extends BlocListener<C, ViewState> {
  ViewStateListener({
    Key? key,
    C? cubit,
    ViewStateListenerCondition? listenWhen,
    LoadingCallback? onLoading,
    RefreshingCallback<T>? onRefreshing,
    SuccessCallback<T>? onSuccess,
    EmptyCallback? onEmpty,
    ErrorCallback? onError,
    Widget? child,
  }) : super(
    key: key,
    bloc: cubit,
    listenWhen: listenWhen,
    child: child,
    listener: (BuildContext context, ViewState state) {
      if (state is Loading) {
        onLoading?.call(context);
      } else if (state is Refreshing<T>) {
        onRefreshing?.call(context, state.data);
      } else if (state is Success<T>) {
        onSuccess?.call(context, state.data);
      } else if (state is Empty) {
        onEmpty?.call(context);
      } else if (state is Failure) {
        onError?.call(context, state.error);
      }
    },
  );
}
