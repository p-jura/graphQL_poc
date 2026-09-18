part of './single_character_cubit.dart';

enum SingleCharacterStatus { initial, loading, loaded, error }

class SingleCharacterState extends Equatable {
  final SingleCharacterStatus status;
  final SingleCharacterModel? character;

  const SingleCharacterState({
    this.character,
    this.status = SingleCharacterStatus.initial,
  });

  SingleCharacterState copyWith({
    SingleCharacterStatus? status,
    SingleCharacterModel? character,
  }) {
    return SingleCharacterState(
      status: status ?? this.status,
      character: character ?? this.character,
    );
  }

  @override
  List<Object?> get props => [character, status];
}
