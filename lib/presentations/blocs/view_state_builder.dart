import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_state.dart';

typedef InitialBuilder = Widget Function(BuildContext context);

typedef LoadingBuilder = Widget? Function(BuildContext context);

typedef SuccessBuilder<T> = Widget? Function(BuildContext context, T data);

typedef RefreshingBuilder<T> = Widget Function(BuildContext context, T data);

typedef EmptyBuilder = Widget Function(BuildContext context);

typedef ChildWidgetBuilder = Widget Function(BuildContext context);

typedef ErrorBuilder = Widget? Function(
    BuildContext context,
    dynamic error,
    );

typedef ViewStateBuilderCondition = bool Function(
    ViewState previous,
    ViewState current,
    );

class ViewStateBuilder<T, C extends BlocBase<ViewState>>
    extends BlocBuilder<C, ViewState> {
  ViewStateBuilder({
    Key? key,
    C? cubit,
    InitialBuilder? onReady,
    LoadingBuilder? onLoading,
    RefreshingBuilder<T>? onRefreshing,
    SuccessBuilder<T>? onSuccess,
    EmptyBuilder? onEmpty,
    ErrorBuilder? onError,
    ViewStateBuilderCondition? buildWhen,
  }) : super(
    key: key,
    bloc: cubit,
    buildWhen: buildWhen,
    builder: (BuildContext context, ViewState state) {
      if (state is Initial) {
        return onReady?.call(context) ?? const SizedBox.shrink();
      } else if (state is Loading) {
        return onLoading?.call(context) ?? const SizedBox.shrink();
      } else if (state is Refreshing<T>) {
        return onRefreshing?.call(context, state.data) ?? const SizedBox.shrink();
      } else if (state is Success<T>) {
        return onSuccess?.call(context, state.data) ?? const SizedBox.shrink();
      } else if (state is Empty) {
        return onEmpty?.call(context) ?? const SizedBox.shrink();
      } else if (state is Failure) {
        return onError?.call(context, state.error) ?? const SizedBox.shrink();
      } else {
        throw ArgumentError.value(state, 'state');
      }
    },
  );
}

class ViewStateConsume<T, C extends BlocBase<ViewState>> extends BlocConsumer<C, ViewState> {
  ViewStateConsume({
    Key? key,
    C? cubit,
    InitialBuilder? onReady,
    LoadingBuilder? onLoading,
    RefreshingBuilder<T>? onRefreshing,
    SuccessBuilder<T>? onSuccess,
    EmptyBuilder? onEmpty,
    ErrorBuilder? onError,
    ViewStateBuilderCondition? buildWhen,
    ChildWidgetBuilder? child,
  }) : super(
    key: key,
    bloc: cubit,
    buildWhen: buildWhen,
    listener: (BuildContext context, ViewState state) {
      if (state is Initial) {
        onReady?.call(context) ?? const SizedBox.shrink();
      } else if (state is Loading) {
        onLoading?.call(context) ?? const SizedBox.shrink();
      } else if (state is Refreshing<T>) {
        onRefreshing?.call(context, state.data) ?? const SizedBox.shrink();
      } else if (state is Success<T>) {
        onSuccess?.call(context, state.data) ?? const SizedBox.shrink();
      } else if (state is Empty) {
        onEmpty?.call(context) ?? const SizedBox.shrink();
      } else if (state is Failure) {
        onError?.call(context, state.error) ?? const SizedBox.shrink();
      } else {
        throw ArgumentError.value(state, 'state');
      }
    },
    builder: (BuildContext context, ViewState state) {
      return child?.call(context) ?? const SizedBox.shrink();
    },
  );
}

