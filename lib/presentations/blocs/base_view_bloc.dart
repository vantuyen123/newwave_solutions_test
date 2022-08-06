import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_event.dart';
import 'package:newwave_solutions_test/presentations/blocs/view_state.dart';


class BaseViewBloc<T> extends Bloc<ViewEvent, ViewState> {
  final T useCase;

  BaseViewBloc(this.useCase)
      : assert(useCase != null),
        super(const Initial());

  @override
  Future<void> close() {
    return super.close();
  }
  @override
  Stream<ViewState> mapEventToState(ViewEvent event) async* {
    if (event is ArgumentViewEvent<T>) {
      yield* _mapLoadView(event.argument);
    } else if (event is RefreshView<T> && _isRefreshPossible(event)) {
      yield* _mapRefreshView(event.filter);
    } else if (event is ErrorViewEvent) {
      yield Failure(event.error);
    }
  }

  bool _isRefreshPossible(ViewEvent event) =>
      state is Success || state is Empty;

  Stream<ViewState> _mapLoadView(T? argument) async* {
    yield const Loading();
    yield* _getViewState();
  }

  Stream<ViewState> _mapRefreshView(T? filter) async* {
    final elements = _getCurrentStateElements();
    yield Refreshing(elements);
    yield* _getViewState();
  }

  List<T> _getCurrentStateElements() =>
      (state is Success<List<T>>) ? (state as Success<List<T>>).data : [];

  Stream<ViewState> _getViewState() async* {
    try {
      final List<T>? elements = await _getElementsFromRepository();
      yield elements?.isNotEmpty ?? false
          ? Success<List<T>>(UnmodifiableListView(elements ?? List.empty()))
          : const Empty();
    } catch (e) {
      yield Failure(e);
    } finally {}
  }

  Future<List<T>>? _getElementsFromRepository() {
    return null;
  }
}
