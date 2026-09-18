import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/use_case/use_case.dart';
import 'package:flutter_graphql_poc/features/characters/domain/use_cases/get_characters_use_case.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/character_model.dart';

part './characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final GetCharactersUseCase _getCharacterUseCase;

  CharactersCubit({required UseCase getCharacterUseCase})
    : _getCharacterUseCase = getCharacterUseCase as GetCharactersUseCase,
      super(CharactersState());

  void getCharacters([int page = 1]) async {
    emit(CharactersState(status: CharactersStatus.loading));

    try {
      final result = await _getCharacterUseCase.call(page);

      emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: result.models,
        ),
      );
    } on Exception catch (e) {
      emit(
        CharactersState(
          status: CharactersStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
