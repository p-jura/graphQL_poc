import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_poc/core/use_case/use_case.dart';
import 'package:flutter_graphql_poc/features/characters/domain/use_cases/get_single_character_use_case.dart';
import 'package:flutter_graphql_poc/features/characters/presentation/models/single_character_model.dart';

part './single_character_state.dart';

class SingleCharacterCubit extends Cubit<SingleCharacterState> {
  final GetSingleCharacterUseCase _getSingleCharacterUseCase;

  SingleCharacterCubit({required UseCase getSingleCharacterUseCase})
    : _getSingleCharacterUseCase =
          getSingleCharacterUseCase as GetSingleCharacterUseCase,
      super(SingleCharacterState());

  void getSingleCharacter({required int id}) async {
    emit(SingleCharacterState(status: SingleCharacterStatus.loading));
    try {
      final result = await _getSingleCharacterUseCase.call(id);
      emit(
        state.copyWith(status: SingleCharacterStatus.loaded, character: result),
      );
    } on Exception catch (e) {
      emit(state);
    }
  }
}
