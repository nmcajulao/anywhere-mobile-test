import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({
    this.data,
    this.error,
  });
}

// * handles successful reposiory result and store it in a class [data] parameter
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

// * handles unsuccessful reposiory result and store it in a class [error] parameter
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
