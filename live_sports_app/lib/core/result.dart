sealed class Result<S, F> {
  const Result();

  R fold<R>(R Function(S value) onSuccess, R Function(F error) onFailure) {
    return switch (this) {
      ResultSuccess<S, F>(:final value) => onSuccess(value),
      ResultFailure<S, F>(:final error) => onFailure(error),
    };
  }
}

final class ResultSuccess<S, F> extends Result<S, F> {
  const ResultSuccess(this.value);

  final S value;
}

final class ResultFailure<S, F> extends Result<S, F> {
  const ResultFailure(this.error);

  final F error;
}