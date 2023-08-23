part of 'character_details_bloc.dart';

sealed class CharacterDetailsState extends Equatable {
  const CharacterDetailsState();

  @override
  List<Object> get props => [];
}

final class CharacterDetailsLoading extends CharacterDetailsState {}

final class CharacterDetailsDone extends CharacterDetailsState {
  CharacterEntity characterEntity;

  CharacterDetailsDone({
    required this.characterEntity,
  });
}

final class CharacterDetailsError extends CharacterDetailsState {}
