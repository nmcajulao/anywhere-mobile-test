part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class GetCharacters extends CharacterEvent {}

class FilterCharacters extends CharacterEvent {
  final String filter;

  const FilterCharacters({
    required this.filter,
  });
}
