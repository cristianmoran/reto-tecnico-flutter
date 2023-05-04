import 'package:flutter/widgets.dart';

abstract class ResultadoState {
  ResultadoState();

  factory ResultadoState.loading() => LoadingResultadoState();

  factory ResultadoState.loaded(T) => LoadedResultadoState(result: T);

  factory ResultadoState.error(String message) => ErrorResultadoState(message: message);
}

class LoadingResultadoState extends ResultadoState {
  LoadingResultadoState();
}

class LoadedResultadoState<T> extends ResultadoState {
  final T result;

  LoadedResultadoState({required this.result});
}

class ErrorResultadoState extends ResultadoState {
  final String message;

  ErrorResultadoState({required this.message});
}