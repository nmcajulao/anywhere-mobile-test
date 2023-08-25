import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_details/character_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CharacterDetailsBloc characterDetailsBloc;

  setUp(() {
    characterDetailsBloc = CharacterDetailsBloc();
  });

  test('character details bloc should be on its initial state', () {
    expect(characterDetailsBloc.state, CharacterDetailsInitial());
  });

  blocTest<CharacterDetailsBloc, CharacterDetailsState>(
    'emits [CharacterDetailsLoading, CharacterDetailsDone] states when SetCharacterDetails event is added and fetching is successful.',
    build: () {
      return characterDetailsBloc;
    },
    act: (bloc) => bloc.add(
      SetCharacterDetails(
        characterEntity: const CharacterEntity(
            image: 'sample/image.png',
            title: 'Alice',
            description: "Some sample small description for this character."),
      ),
    ),
    expect: () => <CharacterDetailsState>[
      CharacterDetailsLoading(),
      CharacterDetailsDone(
        characterEntity: const CharacterEntity(
            image: 'sample/image.png',
            title: 'Alice',
            description: "Some sample small description for this character."),
      ),
    ],
  );
}
