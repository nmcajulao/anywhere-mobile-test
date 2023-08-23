import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  CharacterDetailsBloc() : super(CharacterDetailsLoading()) {
    on<SetCharacterDetails>(_onSetCharacterDetails);
  }

  void _onSetCharacterDetails(
      SetCharacterDetails event, Emitter<CharacterDetailsState> emit) async {
    final state = this.state;

    debugPrint("HEEEEEEERE: ${event.characterEntity.toString()}");

    emit(CharacterDetailsLoading());

    emit(
      CharacterDetailsDone(
        characterEntity: event.characterEntity,
      ),
    );
  }
}
