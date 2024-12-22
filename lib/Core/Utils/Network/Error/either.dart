class FetchResult<T, E> {
  final T? success;
  final E? error;

  FetchResult._({this.success, this.error});

  // Factory constructor for success
  factory FetchResult.success(T data) {
    return FetchResult._(success: data);
  }

  // Factory constructor for error
  factory FetchResult.error(E errorData) {
    return FetchResult._(error: errorData);
  }

  // Check if the result is a success
  bool get isSuccess => success != null;

  // Check if the result is an error
  bool get isError => error != null;

  // Fold method to handle success and error cases
  R fold<R>(R Function(T success) onSuccess, R Function(E error) onError) {
    if (isSuccess) {
      return onSuccess(success as T); // Use ! to assert non-null
    } else {
      return onError(error as E); // Use ! to assert non-null
    }
  }
}
