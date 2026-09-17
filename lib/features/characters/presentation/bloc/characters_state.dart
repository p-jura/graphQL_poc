part of 'characters_cubit.dart';

class CharacterState extends Equatable {
  final List<CharacterModel>? characters;

  const CharacterState({required this.characters});

  factory CharacterState.initial() => CharacterState(characters: null);

  CharacterState copyWith(List<CharacterModel>? characters) =>
      CharacterState(characters: characters);

  @override
  List<Object?> get props => [];
}
