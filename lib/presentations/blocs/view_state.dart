
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ViewState extends Equatable {
  const ViewState();

  @override
  List<Object> get props => [];
}

class Initial extends ViewState {
  const Initial();

  @override
  String toString() => 'Initial';
}

class LoadingStarted extends ViewState {}

class LoadingFinished extends ViewState {}

class Loading extends ViewState {
  const Loading();

  @override
  String toString() => 'Loading';
}

class Refreshing<T> extends ViewState {
  final T data;

  const Refreshing(this.data);

  @override
  List<Object> get props => [data ?? ''];

  @override
  String toString() => 'Refreshing: $data';
}

class Empty extends ViewState {
  const Empty();

  @override
  String toString() => 'Empty';
}

class Success<T> extends ViewState {
  final T data;

  const Success(this.data);

  @override
  List<Object> get props => [data ?? ''];

  @override
  String toString() => 'Success: $data';
}

class SuccessNavigation<T> extends ViewState {
  final T data;

  const SuccessNavigation(this.data);

  @override
  List<Object> get props => [data ?? ''];

  @override
  String toString() => 'Success: $data';
}

class Failure extends ViewState {
  final dynamic error;

  const Failure(this.error) : assert(error != null);

  @override
  List<Object> get props => [''];

  @override
  String toString() => 'Failure: $error';
}
