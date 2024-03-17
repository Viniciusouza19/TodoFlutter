

enum AsyncStatus {
  isInitial,
  isLoading,
  isLoad,
  isFailure
}

extension AsyncStatusEx on AsyncStatus {
  bool get isInitial => this == AsyncStatus.isInitial;

  bool get isLoading => this == AsyncStatus.isLoading;

  bool get isLoad => this == AsyncStatus.isLoad;

  bool get isFailure => this == AsyncStatus.isFailure;
}
