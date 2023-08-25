import 'package:anywhere_mobile_test/core/resources/data_state.dart';
import 'package:anywhere_mobile_test/features/characters/domain/entities/character.dart';
import 'package:anywhere_mobile_test/features/characters/presentation/bloc/character_list/character_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCharacterUseCase mockGetCharacterUseCase;
  late CharacterBloc characterBloc;

  final characters = [
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Alice',
        description: "Some sample small description for this character."),
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Bob',
        description: "Some sample small description for this character."),
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Charlie',
        description: "Some sample small description for this character."),
  ];

  final expectedFilteredCharacters = [
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Alice',
        description: "Some sample small description for this character."),
    const CharacterEntity(
        image: 'sample/image.png',
        title: 'Charlie',
        description: "Some sample small description for this character."),
  ];

  const filterQuery = 'li';

  setUp(() {
    mockGetCharacterUseCase = MockGetCharacterUseCase();
    characterBloc = CharacterBloc(mockGetCharacterUseCase);

    // Add characters to the bloc's list
    characterBloc.characterEntityOriginal.addAll(characters);
  });

  DioException dioException = DioException(
    requestOptions: RequestOptions(path: '/api/endpoint'),
    response: Response(
      statusCode: 404,
      data: {'error': 'Not found'},
      requestOptions: RequestOptions(path: '/api/endpoint'),
    ),
  );

  test('character bloc should be on its initial state', () {
    expect(characterBloc.state, CharacterInitial());
  });

  blocTest<CharacterBloc, CharacterState>(
    'emits [CharacterLoading, CharacterDone] states when GetCharacters event is added and fetching is successful.',
    build: () {
      when(
        mockGetCharacterUseCase.call(),
      ).thenAnswer(
        (realInvocation) async => const DataSuccess([]),
      );

      return characterBloc;
    },
    act: (bloc) => bloc.add(GetCharacters()),
    expect: () => <CharacterState>[
      CharacterLoading(),
      const CharacterDone([]),
    ],
  );

  blocTest<CharacterBloc, CharacterState>(
    'emits [CharacterLoading, CharacterError] states when GetCharacters event is added and fetching is unsuccessful.',
    build: () {
      when(
        mockGetCharacterUseCase.call(),
      ).thenAnswer(
        (realInvocation) async => DataFailed(
          dioException,
        ),
      );

      return characterBloc;
    },
    act: (bloc) => bloc.add(GetCharacters()),
    expect: () => <CharacterState>[
      CharacterLoading(),
      CharacterError(dioException),
    ],
  );

  blocTest<CharacterBloc, CharacterState>(
    'emits [CharacterLoading, CharacterDone] filtered characters',
    build: () => characterBloc,
    act: (bloc) {
      bloc.add(const FilterCharacters(filter: filterQuery));
    },
    expect: () => <CharacterState>[
      CharacterLoading(),
      CharacterDone(expectedFilteredCharacters),
    ],
  );
}
