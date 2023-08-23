import 'package:anywhere_mobile_test/core/resources/data_state.dart';
import 'package:anywhere_mobile_test/features/characters/domain/usecases/get_characters.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/character.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  List<CharacterEntity> _characterEntityOriginal = [];

  final GetCharacterUseCase _getCharacterUseCase;

  CharacterBloc(this._getCharacterUseCase) : super(CharacterLoading()) {
    on<GetCharacters>(_onGetCharacters);
    on<FilterCharacters>(_onFilterCharacters);
  }

  void _onGetCharacters(
      GetCharacters event, Emitter<CharacterState> emit) async {
    final dataState = await _getCharacterUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      _characterEntityOriginal = dataState.data!;

      emit(
        CharacterDone(dataState.data!),
      );
    } else if (dataState is DataFailed) {
      debugPrint("DATA FAILED: ${dataState.error!.message}");
      emit(
        CharacterError(dataState.error!),
      );
    }
  }

  void _onFilterCharacters(
      FilterCharacters event, Emitter<CharacterState> emit) async {
    final state = this.state;

    debugPrint("HEEEEEEEEERERE");
    debugPrint(state.runtimeType.toString());

    if (state is CharacterDone) {
      debugPrint(
          "_characterEntityOriginal length: ${_characterEntityOriginal.length}");
      debugPrint("filter: ${event.filter}");
      debugPrint([..._characterEntityOriginal]
          .where(
            (element) => element.title
                .toUpperCase()
                .contains(event.filter.toUpperCase()),
          )
          .toList()
          .length
          .toString());

      emit(CharacterLoading());

      emit(
        CharacterDone(
          [..._characterEntityOriginal]
              .where(
                (element) => element.title
                    .toUpperCase()
                    .contains(event.filter.toUpperCase()),
              )
              .toList(),
        ),
      );
    }
  }
}
