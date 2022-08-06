import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Base class for all list events.
@immutable
abstract class ViewEvent extends Equatable {
  const ViewEvent();

  @override
  List<Object?> get props => [];
}

class SubmitViewEvent extends ViewEvent {
  const SubmitViewEvent();

  @override
  List<Object?> get props => [];
}

class LoadingStartedEvent extends ViewEvent {}

class LoadingFinishedEvent extends ViewEvent {}

class ViewEventInitial extends ViewEvent {}

class LoginWithGoogleEvent extends ViewEvent {}

class LoginWithFacebookEvent extends ViewEvent {}

class LoginWithZaloEvent extends ViewEvent {}


class LogoutEvent extends ViewEvent {}

class ErrorViewEvent extends ViewEvent {
  final dynamic error;

  const ErrorViewEvent({required this.error});

  @override
  List<Object?> get props => [];
}

class ArgumentViewEvent<T> extends ViewEvent {
  final T? argument;

  const ArgumentViewEvent([this.argument]);

  @override
  List<Object> get props => [argument ?? ''];
}

class ArgumentViewInitEvent<T> extends ViewEvent {
  final T? argument;

  const ArgumentViewInitEvent([this.argument]);

  @override
  List<Object> get props => [argument ?? ''];
}

class LoadView<F> extends ViewEvent {
  final F? filter;

  const LoadView([this.filter]);

  @override
  List<Object> get props => [filter ?? ''];

  @override
  String toString() => 'LoadList: $filter';
}

class RefreshView<F> extends ViewEvent {
  final F? filter;

  const RefreshView([this.filter]);

  @override
  List<Object> get props => [filter ?? ''];

  @override
  String toString() => 'RefreshList: $filter';
}
