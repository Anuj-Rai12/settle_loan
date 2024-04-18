

class Inital {}

class Loading<T> {
  final T data;

  Loading(this.data);
}

class Success<T> {
  final T data;

  Success(this.data);
}

class Error {
  final String? error;
  final Exception? e;

  Error(this.e, this.error);
}
