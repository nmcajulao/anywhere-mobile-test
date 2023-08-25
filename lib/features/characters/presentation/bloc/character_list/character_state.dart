part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  final List<CharacterEntity>? characters;
  final DioException? exception;

  const CharacterState({
    this.characters,
    this.exception,
  });

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

final class CharacterLoading extends CharacterState {}

final class CharacterDone extends CharacterState {
  const CharacterDone(List<CharacterEntity> characters)
      : super(characters: characters);
}

final class CharacterError extends CharacterState {
  const CharacterError(DioException exception) : super(exception: exception);
}
