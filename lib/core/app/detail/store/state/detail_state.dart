sealed class DetailState {}

class DetailStateStateInitial extends DetailState {}

class DetailStateStateLoading extends DetailState {}

class DetailStateStateSuccess extends DetailState {
  final bool isFavoriteMovie;

  DetailStateStateSuccess({required this.isFavoriteMovie});
}

class DetailStateStateError extends DetailState {
  final String error;

  DetailStateStateError({required this.error});
}
