part of './single_character_cubit.dart';

enum SingleCharacterStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isError => this == SingleCharacterStatus.error;
}

class SingleCharacterState extends Equatable {
  final SingleCharacterStatus status;
  final SingleCharacterModel? character;
  final String? errorMessage;

  const SingleCharacterState({
    this.character,
    this.status = SingleCharacterStatus.initial,
    this.errorMessage,
  });

  SingleCharacterState copyWith({
    SingleCharacterStatus? status,
    SingleCharacterModel? character,
    String? errorMessage,
  }) {
    return SingleCharacterState(
      status: status ?? this.status,
      character: character ?? this.character,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [character, status, errorMessage];
}
