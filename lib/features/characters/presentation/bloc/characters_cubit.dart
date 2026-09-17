import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/use_case/use_case.dart';
import 'package:flutter_graphql_poc/features/characters/domain/get_characters_use_case.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

part './characters_state.dart';

class CharactersCubit extends Cubit<CharacterState> {
  final GetCharactersUseCase _getCharacterUseCase;

  CharactersCubit({required UseCase getCharacterUseCase})
    : _getCharacterUseCase = getCharacterUseCase as GetCharactersUseCase,
      super(CharacterState.initial());

  void getCharacters([int? page]) async {
    final result = await _getCharacterUseCase.call(page ?? 1);
    emit(state.copyWith(result.models));
  }
}
