part of 'characters_cubit.dart';

enum CharactersStatus { initial, loading, success, failure }

final class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const [],
    this.errorMessage,
  });

  final CharactersStatus status;
  final List<CharacterModel> characters;
  final String? errorMessage;

  CharactersState copyWith({
    CharactersStatus? status,
    List<CharacterModel>? characters,
    String? errorMessage,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, characters, errorMessage];
}
