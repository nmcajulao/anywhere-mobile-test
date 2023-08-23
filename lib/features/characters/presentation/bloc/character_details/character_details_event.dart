part of 'character_details_bloc.dart';

sealed class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();

  @override
  List<Object> get props => [];
}

class SetCharacterDetails extends CharacterDetailsEvent {
  CharacterEntity characterEntity;

  SetCharacterDetails({
    required this.characterEntity,
  });
}
