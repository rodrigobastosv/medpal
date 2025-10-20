typedef SuccessCallback<W, S> = W Function(S success);
typedef ErrorCallback<W, E> = W Function(E error);

sealed class Result<E, S> {
  const Result();

  W when<W>(ErrorCallback<W, E> whenError, SuccessCallback<W, S> whenSuccess);

  bool get isSuccess;

  bool get isError;

  R? whenSuccess<R>(R Function(S success) whenSuccess);

  R? whenError<R>(R Function(E error) whenError);

  S? getSuccess();

  E? getError();
}

final class Success<E, S> extends Result<E, S> {
  const Success(this.value);

  final S value;

  @override
  W when<W>(ErrorCallback<W, E> whenError, SuccessCallback<W, S> whenSuccess) => whenSuccess(value);

  @override
  bool get isSuccess => true;

  @override
  bool get isError => false;

  @override
  R whenSuccess<R>(R Function(S success) whenSuccess) => whenSuccess(value);

  @override
  R? whenError<R>(R Function(E error) whenError) => null;

  @override
  S? getSuccess() => value;

  @override
  E? getError() => null;
}

final class Error<E, S> extends Result<E, S> {
  const Error(this.error);

  final E error;

  @override
  W when<W>(ErrorCallback<W, E> whenError, SuccessCallback<W, S> whenSuccess) => whenError(error);

  @override
  bool get isSuccess => false;

  @override
  bool get isError => true;

  @override
  R? whenSuccess<R>(R Function(S success) whenSuccess) => null;

  @override
  R whenError<R>(R Function(E error) whenError) => whenError(error);

  @override
  S? getSuccess() => null;

  @override
  E? getError() => error;
}
